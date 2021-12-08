-- Inserts integration test data into mysql docker instance
USE firewall_acceptance;

INSERT INTO ADV_ENTITY(ID, NAME, AGENCY_ID, ADVERTISER_ID, CAMPAIGN_ID, PLAN_ID, TAG_API_USER_ID) VALUES(12345, 'TEST_ENTITY_CFID', 1, 1, 1, 1, 1);
INSERT INTO ADV_ENTITY(ID, NAME, AGENCY_ID, ADVERTISER_ID, CAMPAIGN_ID, PLAN_ID, TAG_API_USER_ID) VALUES(12346, 'TEST_ADVERTISER_CFID', 1, 1, 1, 1, 1);
INSERT INTO ADV_ENTITY(ID, NAME, AGENCY_ID, ADVERTISER_ID, CAMPAIGN_ID, PLAN_ID, TAG_API_USER_ID) VALUES(12347, 'TEST_ENTITY_CFID_NO_CONTEXTUAL', 1, 1, 1, 1, 1);
INSERT INTO ADV_ENTITY(ID, NAME, AGENCY_ID, ADVERTISER_ID, CAMPAIGN_ID, PLAN_ID, TAG_API_USER_ID) VALUES(12348, 'TEST_ENTITY_CFID_NO_DATA', 1, 1, 1, 1, 1);

INSERT INTO app_user.team(ID) VALUES(1471);
INSERT INTO app_user.team(ID) VALUES(23464);
INSERT INTO app_user.team(ID) VALUES(4567);
INSERT INTO app_user.team(ID) VALUES(8765);

INSERT INTO DSP_ADVERTISER_TEAM_MAPPING(TEAM_ID, ADV_ENTITY_ID, PARTNER_ENTITY_ID, CFID_TYPE, CREATED_BY) VALUES(1471,12345,'entityCfid', 'ENTITY', -2);
INSERT INTO DSP_ADVERTISER_TEAM_MAPPING(TEAM_ID, ADV_ENTITY_ID, PARTNER_ENTITY_ID, CFID_TYPE, CREATED_BY) VALUES(23464,12346,'advertiserCfid', 'ADVERTISER', -2);
INSERT INTO DSP_ADVERTISER_TEAM_MAPPING(TEAM_ID, ADV_ENTITY_ID, PARTNER_ENTITY_ID, CFID_TYPE, CREATED_BY) VALUES(4567,12347,'entityCfidWithoutContextual', 'ENTITY', -2);
INSERT INTO DSP_ADVERTISER_TEAM_MAPPING(TEAM_ID, ADV_ENTITY_ID, PARTNER_ENTITY_ID, CFID_TYPE, CREATED_BY) VALUES(8765,12348,'entityCfidWithNoData', 'ENTITY', -2);

INSERT INTO SUITABILITY_PROFILE(ID, ADMANTX_API_KEY, NAME, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(1007, '05bbe72eaf369e9bd62cab40c392f37863da75085f3be41a645c9150c5d07a86', 'TEST_SUITABILITY_PROFILE_1', 'Test Suitability Profile 1', -2, -2);
INSERT INTO SUITABILITY_PROFILE(ID, ADMANTX_API_KEY, NAME, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(1025, '1c22751cc0c468f9d871f942f203a3b87b4d0188c2943af29cf1c3c3f6f4a655', 'TEST_SUITABILITY_PROFILE_2', 'Test Suitability Profile 2', -2, -2);

INSERT INTO SUITABILITY_PROFILE_TEAM(TEAM_ID, SUITABILITY_PROFILE_ID) VALUES(1471, 1007);
INSERT INTO SUITABILITY_PROFILE_TEAM(TEAM_ID, SUITABILITY_PROFILE_ID) VALUES(23464, 1025);

INSERT INTO DSP_INTEGRATION_PARTNER(ADV_ENTITY_ID, CONTEXTUAL_PARTNER_ID, CREATED_BY) VALUES(12345, '05bbe72eaf369e9bd62cab40c392f37863da75085f3be41a645c9150c5d07a86', -2);
INSERT INTO DSP_INTEGRATION_PARTNER(ADV_ENTITY_ID, CONTEXTUAL_PARTNER_ID, CREATED_BY) VALUES(12346, '1c22751cc0c468f9d871f942f203a3b87b4d0188c2943af29cf1c3c3f6f4a655', -2);


INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(1, 100131, 'IAS_131_KW', TRUE, 1, 'Test Keyword 1', -2, -2);
INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(2, 2004243, 'IAS_4243_BL', TRUE, 4, 'Test Blacklist 1', -2, -2);
INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(3, 100460, 'IAS_460_KW', TRUE, 1, 'Test Keyword 2', -2, -2);
INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(4, NULL, NULL, FALSE, 1, 'IRRELEVANT', -2, -2);
INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(5, NULL, NULL, FALSE, 4, 'IRRELEVANT', -2, -2);
INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(6, 2004956, 'IAS_4956_BL', TRUE, 4, 'Test Blacklist 2', -2, -2);
INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(7, 1001199, 'IAS_1199_KW', TRUE, 1, 'Test Keyword 3', -2, -2);
INSERT INTO custom_lists.CUSTOM_LIST(ID, SEGMENT_API_ID, SEGMENT_API_NAME, SEGMENT_API_FL, CUSTOM_LIST_TYPE_ID, DESCRIPTION, CREATED_BY, MODIFIED_BY) VALUES(8, 2004968, 'IAS_4968_BL', TRUE, 4, 'Test Blacklist 3', -2, -2);

INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12345, 1);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12345, 2);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12345, 3);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12345, 6);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12345, 7);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12345, 8);

INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12346, 1);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12346, 2);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12346, 3);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12346, 6);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12346, 7);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12346, 8);

INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12347, 1);
INSERT INTO custom_lists.CUSTOM_LIST_ADV_ENTITY(ADV_ENTITY_ID, CUSTOM_LIST_ID) VALUES(12347, 2);

COMMIT;