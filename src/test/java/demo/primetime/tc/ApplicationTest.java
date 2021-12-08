package demo.primetime.tc;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.MySQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
@Testcontainers
public class ApplicationTest {

    @Container
    private static final MySQLContainer CONTAINER = new MySQLContainer(
            DockerImageName.parse("nexus.303net.net/pathfinders/integraldbs:latest")
                    .asCompatibleSubstituteFor("mysql"))
            .withDatabaseName("firewall_acceptance")
            .withUsername("liquibase")
            .withPassword("l1qu1b4s3");

    static {
        CONTAINER.withInitScript("setup-integration-test-data.sql");
    }

    @DynamicPropertySource
    static void postgresqlProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", CONTAINER::getJdbcUrl);
        registry.add("spring.datasource.username", CONTAINER::getUsername);
        registry.add("spring.datasource.password", CONTAINER::getPassword);
    }

    @Test
    public void tcTest1() throws SQLException {
        ResultSet resultSet = performQuery(CONTAINER, "SELECT 1");
        int resultSetInt = resultSet.getInt(1);

        assertEquals(1, resultSetInt);
    }

    @Test
    public void tcTest2() throws SQLException {
        ResultSet resultSet = performQuery(CONTAINER, "SELECT NAME FROM SUITABILITY_PROFILE WHERE ID = 1007");
        String name = resultSet.getString(1);

        assertEquals("TEST_SUITABILITY_PROFILE_1", name);
    }

    @Test
    public void tcTest3() throws SQLException {
        ResultSet resultSet = performQuery(CONTAINER, "SELECT SUITABILITY_PROFILE_ID FROM SUITABILITY_PROFILE_TEAM WHERE TEAM_ID = 1471");
        Long id = resultSet.getLong(1);

        assertEquals(1007L, id);
    }

    private DataSource getDataSource(MySQLContainer container) {
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setJdbcUrl(container.getJdbcUrl());
        hikariConfig.setUsername(container.getUsername());
        hikariConfig.setPassword(container.getPassword());
        hikariConfig.setDriverClassName(container.getDriverClassName());
        return new HikariDataSource(hikariConfig);
    }

    private ResultSet performQuery(MySQLContainer container, String sql) throws SQLException {
        DataSource ds = getDataSource(container);
        Statement statement = ds.getConnection().createStatement();
        statement.execute(sql);
        ResultSet resultSet = statement.getResultSet();

        resultSet.next();
        return resultSet;
    }
}