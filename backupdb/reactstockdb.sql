/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_PHP7_Localhost
 Source Server Type    : MySQL
 Source Server Version : 100316
 Source Host           : localhost:3306
 Source Schema         : reactstockdb

 Target Server Type    : MySQL
 Target Server Version : 100316
 File Encoding         : 65001

 Date: 01/04/2021 12:26:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `published_at` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Electronic', 1, '2021-03-21 14:37:37', 1, 1, '2021-03-21 14:37:35', '2021-03-21 14:37:37');
INSERT INTO `categories` VALUES (2, 'Cloth', 1, '2021-03-21 14:38:02', 1, 1, '2021-03-21 14:38:01', '2021-03-21 14:38:02');
INSERT INTO `categories` VALUES (3, 'Mom & Kid', 1, '2021-03-21 14:38:12', 1, 1, '2021-03-21 14:38:10', '2021-03-21 14:38:12');

-- ----------------------------
-- Table structure for core_store
-- ----------------------------
DROP TABLE IF EXISTS `core_store`;
CREATE TABLE `core_store`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `environment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_store
-- ----------------------------
INSERT INTO `core_store` VALUES (1, 'model_def_strapi::core-store', '{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (2, 'model_def_strapi::webhooks', '{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (3, 'model_def_strapi::permission', '{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"fields\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (4, 'model_def_strapi::role', '{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (5, 'model_def_strapi::user', '{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (6, 'model_def_plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (7, 'model_def_plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (8, 'model_def_plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"products\":{\"via\":\"users\",\"collection\":\"product\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (9, 'model_def_plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (10, 'plugin_users-permissions_grant', '{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (11, 'plugin_upload_settings', '{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":true}', 'object', 'development', '');
INSERT INTO `core_store` VALUES (12, 'plugin_content_manager_configuration_content_types::strapi::permission', '{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"fields\":{\"edit\":{\"label\":\"Fields\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Fields\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"fields\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (13, 'plugin_content_manager_configuration_content_types::strapi::role', '{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (14, 'plugin_content_manager_configuration_content_types::strapi::user', '{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (15, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (16, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (17, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"products\":{\"edit\":{\"label\":\"Products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"Products\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]],\"editRelations\":[\"role\",\"products\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (18, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (19, 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', '', '');
INSERT INTO `core_store` VALUES (20, 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}', 'object', '', '');
INSERT INTO `core_store` VALUES (21, 'core_admin_auth', '{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}', 'object', '', '');
INSERT INTO `core_store` VALUES (22, 'model_def_application::stock.stock', '{\"uid\":\"application::stock.stock\",\"collectionName\":\"stocks\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Stock\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"Pname\":{\"type\":\"string\"},\"Pprice\":{\"type\":\"integer\"},\"Pqty\":{\"type\":\"integer\"},\"Pdate\":{\"type\":\"datetime\"},\"Pstatus\":{\"type\":\"integer\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (24, 'model_def_application::category.category', '{\"uid\":\"application::category.category\",\"collectionName\":\"categories\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Category\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"title\":{\"type\":\"string\"},\"status\":{\"type\":\"boolean\",\"default\":true,\"required\":false,\"unique\":false,\"private\":false},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (25, 'plugin_content_manager_configuration_content_types::application::category.category', '{\"uid\":\"application::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"Status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Status\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"status\",\"published_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"status\",\"size\":4}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (26, 'model_def_application::product.product', '{\"uid\":\"application::product.product\",\"collectionName\":\"products\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Product\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"title\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\",\"targetField\":\"title\"},\"description\":{\"type\":\"richtext\"},\"price\":{\"type\":\"decimal\"},\"qty\":{\"type\":\"integer\"},\"image\":{\"collection\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\"],\"plugin\":\"upload\",\"required\":false},\"is_featured\":{\"type\":\"boolean\"},\"category\":{\"model\":\"category\"},\"users\":{\"plugin\":\"users-permissions\",\"model\":\"user\",\"via\":\"products\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (27, 'plugin_content_manager_configuration_content_types::application::product.product', '{\"uid\":\"application::product.product\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"is_featured\":{\"edit\":{\"label\":\"Is_featured\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Is_featured\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":true,\"sortable\":true}},\"price\":{\"edit\":{\"label\":\"Price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Price\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"qty\":{\"edit\":{\"label\":\"Qty\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Qty\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Image\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":false,\"sortable\":false}},\"category\":{\"edit\":{\"label\":\"Category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"Category\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"description\",\"size\":12}],[{\"name\":\"price\",\"size\":4},{\"name\":\"qty\",\"size\":4}],[{\"name\":\"image\",\"size\":6},{\"name\":\"is_featured\",\"size\":4}]],\"editRelations\":[\"category\",\"users\"],\"list\":[\"id\",\"title\",\"slug\",\"price\",\"image\",\"users\",\"category\",\"qty\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (28, 'plugin_documentation_config', '{\"restrictedAccess\":false}', 'object', '', '');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `is_featured` tinyint(1) NULL DEFAULT NULL,
  `category` int(11) NULL DEFAULT NULL,
  `users` int(11) NULL DEFAULT NULL,
  `published_at` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Samsung Galaxy S21 Ultra 5G', 'samsung-galaxy-s21-ultra-5-g', '# Samsung Galaxy S21 Ultra 5G (Ram 12GB + Rom 128/256GB)\n\nชิปเซ็ต Qualcomm Snapdragon 888 แรง เร็ว รองรับสัญญาณ 5G ได้ถึง 13 คลื่นความถี่ทั่วโลก พร้อมระบบการชาร์จไว 65W RAM 12GB ROM 256GB ให้คุณมีประสบการณ์การใช้งานที่รวดเร็วยิ่งขึ้น ColorOS 11.2 65W SuperVOOC Charge\n\nรวม Samsung สมาร์ทโฟนทุกรุ่น ในราคาสุดคุ้ม พร้อมโปรโมชั่น ส่วนลด จัดเต็ม ที่ BNN Online โปรโมชั่นพิเศษเพียบ พร้อมบริการผ่อน 0% รีบมาช้อปออนไลน์ง่ายๆได้แล้ววันนี้', 33900.00, 50, 1, 1, 1, '2021-03-21 14:50:58', 1, 1, '2021-03-21 14:50:56', '2021-03-21 14:50:58');
INSERT INTO `products` VALUES (2, 'iPhone 12 Pro', 'i-phone-12-pro', 'สินค้า Apple มาพร้อมดีไซน์หรูหรา มีสไตล์ ฟังก์ชั่นครบครัน พร้อมโปรโมชั่นพิเศษ ที่ BNN โปรโมชั่นพิเศษเพียบ พร้อมบริการผ่อน 0% รีบมาช้อปออนไลน์ง่ายๆได้แล้ววันนี้ ศูนย์ให้บริการ 300 สาขา บริการส่งทั่วประเทศ แหล่งรวมสินค้าไอที มือถือ สินค้าของแท้ ประกันศูนย์', 35000.00, 10, 1, 1, 2, '2021-03-21 14:53:18', 1, 1, '2021-03-21 14:53:17', '2021-03-21 14:53:18');
INSERT INTO `products` VALUES (5, 'Huawei P30 Pro', 'huawei-p30-pro', 'Huawei P30 Pro', 25000.00, 10, 0, 1, 3, '2021-03-22 15:50:56', 1, 1, '2021-03-22 15:50:54', '2021-03-22 15:50:56');
INSERT INTO `products` VALUES (6, 'Vivo V20', 'vivo-v20', 'Vivo V20 สมาร์ทโฟน หน้าจอ 6.44 นิ้ว Snapdragon 720G Octa\nข้อมูลมือถือ Vivo V20 - วีโว่. เปิดตัวครั้งแรก 19 ตุลาคม 2020 (สยามโฟนฯ); สถานะ มีวางจำหน่ายในประเทศไทย; วางจำหน่าย ไตรมาสที่ 4 ปี 2020 (ตุลาคม 63) - ราคาเปิดตัว ', 25000.00, 1, 1, 1, 1, '2021-03-22 15:56:00', 1, 1, '2021-03-22 15:55:59', '2021-03-22 15:56:00');
INSERT INTO `products` VALUES (8, 'Samsung Galaxy M51', 'samsung-galaxy-m51', 'Galaxy M51 เล่นเน็ต เล่นเกม ชมสิ่งต่างๆ ไม่มีสะดุดบนจอ Infinity-O Display 6.7\" พร้อมแบตเตอรี่ 7000mAh ที่พอใช้ตลอดวัน รองรับชาร์จเร็ว 25W\n\nซื้อ Samsung Galaxy M51 8/128GB ผ่านระบบออนไลน์ที่ Lazada Thailand เรามีส่วนลดและโปรโมชั่นอีกมากมายใน Smartphones.', 15000.00, 2, NULL, 1, 3, '2021-03-22 15:58:24', 1, 1, '2021-03-22 15:58:22', '2021-03-22 15:58:24');
INSERT INTO `products` VALUES (9, 'แก้ไขแล้ว', 'edit-finished', 'test desc edit finished', 111.00, 22, NULL, 1, 1, '2021-03-26 05:51:16', NULL, NULL, '2021-03-26 05:51:16', '2021-03-26 09:29:15');
INSERT INTO `products` VALUES (11, 'itgenius engineering', 'itgenius-engineering', 'test itgenius', 20.00, 2, NULL, 2, 2, '2021-03-26 08:27:19', NULL, NULL, '2021-03-26 08:27:19', '2021-03-26 09:37:44');
INSERT INTO `products` VALUES (14, 'gggg', 'gggg', 'ggg', 33.00, 44, NULL, 3, 2, '2021-03-26 10:15:09', NULL, NULL, '2021-03-26 10:15:09', '2021-03-26 10:15:23');
INSERT INTO `products` VALUES (15, 'bbb', 'ccc', 'ddd', 1.00, 2, NULL, 3, 1, '2021-03-26 10:15:43', NULL, NULL, '2021-03-26 10:15:43', '2021-03-26 10:15:43');
INSERT INTO `products` VALUES (16, 'gggg', 'wwww', 'wwww', 33.00, 22, NULL, 2, 2, '2021-03-26 10:16:03', NULL, NULL, '2021-03-26 10:16:03', '2021-03-26 10:16:03');
INSERT INTO `products` VALUES (17, 'น้ำดื่ม', 'water', 'นี่คือรายละเอียดน้ำดื่ม', 8.00, 9, NULL, 2, 3, '2021-03-26 10:16:53', NULL, NULL, '2021-03-26 10:16:53', '2021-03-26 10:16:53');
INSERT INTO `products` VALUES (23, 'Lenovo L315', 'lenovo-l315', 'test vivo', 10000.00, 10, NULL, 1, 1, '2021-03-31 17:06:37', NULL, NULL, '2021-03-31 17:06:37', '2021-03-31 17:06:37');
INSERT INTO `products` VALUES (24, 'Soundlab', 'soundlab', 'desc sound lab', 4000.00, 10, NULL, 1, 1, '2021-03-31 17:08:03', NULL, NULL, '2021-03-31 17:08:03', '2021-03-31 17:08:03');
INSERT INTO `products` VALUES (25, 'Audio Technica', 'audio-technica', 'Audio Technica description', 2500.00, 5, 1, 1, 2, '2021-03-31 17:21:25', 1, 1, '2021-03-31 17:21:00', '2021-03-31 17:21:25');
INSERT INTO `products` VALUES (26, 'jesss', 'jesss', 'jekafjkas;f', 20.00, 1, NULL, 1, 1, '2021-03-31 18:40:35', NULL, NULL, '2021-03-31 18:40:35', '2021-03-31 18:40:35');
INSERT INTO `products` VALUES (27, 'aaaaffff', 'aaefa', 'asfasf', 33.00, 22, NULL, 1, 1, '2021-03-31 18:42:02', NULL, NULL, '2021-03-31 18:42:02', '2021-03-31 18:42:02');

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Pprice` int(11) NULL DEFAULT NULL,
  `Pqty` int(11) NULL DEFAULT NULL,
  `Pdate` datetime(0) NULL DEFAULT NULL,
  `Pstatus` int(11) NULL DEFAULT NULL,
  `published_at` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stocks
-- ----------------------------
INSERT INTO `stocks` VALUES (1, 'Samsung Note 20', 19500, 2, '2021-03-22 05:30:00', 1, '2021-03-20 17:21:38', 1, 1, '2021-03-20 17:19:13', '2021-03-20 17:21:38');
INSERT INTO `stocks` VALUES (2, 'iPhone 12 XS', 45000, 5, '2021-03-21 06:00:00', 2, '2021-03-20 17:21:42', 1, 1, '2021-03-20 17:19:44', '2021-03-20 17:21:42');

-- ----------------------------
-- Table structure for strapi_administrator
-- ----------------------------
DROP TABLE IF EXISTS `strapi_administrator`;
CREATE TABLE `strapi_administrator`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `resetPasswordToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `registrationToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isActive` tinyint(1) NULL DEFAULT NULL,
  `blocked` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `strapi_administrator_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strapi_administrator
-- ----------------------------
INSERT INTO `strapi_administrator` VALUES (1, 'Samit', 'Koyom', NULL, 'samitkoyom@gmail.com', '$2a$10$ev0YLASIEspUYQdlZGvYpulFGLViRLky3aOhdL0KcSuklpG4oBowy', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for strapi_permission
-- ----------------------------
DROP TABLE IF EXISTS `strapi_permission`;
CREATE TABLE `strapi_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `fields` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `conditions` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `role` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strapi_permission
-- ----------------------------
INSERT INTO `strapi_permission` VALUES (1, 'plugins::upload.read', NULL, NULL, '[]', 2, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (2, 'plugins::upload.assets.create', NULL, NULL, '[]', 2, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (3, 'plugins::upload.assets.update', NULL, NULL, '[]', 2, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (4, 'plugins::upload.assets.download', NULL, NULL, '[]', 2, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (5, 'plugins::upload.assets.copy-link', NULL, NULL, '[]', 2, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (6, 'plugins::upload.read', NULL, NULL, '[\"admin::is-creator\"]', 3, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (7, 'plugins::upload.assets.create', NULL, NULL, '[]', 3, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (8, 'plugins::upload.assets.update', NULL, NULL, '[\"admin::is-creator\"]', 3, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (9, 'plugins::upload.assets.download', NULL, NULL, '[]', 3, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (10, 'plugins::upload.assets.copy-link', NULL, NULL, '[]', 3, '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_permission` VALUES (14, 'plugins::content-manager.explorer.delete', 'plugins::users-permissions.user', NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (15, 'plugins::content-type-builder.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (16, 'plugins::email.settings.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (17, 'plugins::upload.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (18, 'plugins::upload.assets.create', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (19, 'plugins::upload.assets.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (20, 'plugins::upload.assets.download', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (21, 'plugins::upload.assets.copy-link', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (22, 'plugins::content-manager.single-types.configure-view', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (23, 'plugins::content-manager.components.configure-layout', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (24, 'plugins::users-permissions.roles.create', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (25, 'plugins::upload.settings.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (26, 'plugins::content-manager.collection-types.configure-view', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (27, 'plugins::users-permissions.roles.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (28, 'plugins::users-permissions.roles.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (29, 'plugins::users-permissions.roles.delete', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (30, 'plugins::users-permissions.providers.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (31, 'plugins::users-permissions.providers.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (32, 'plugins::users-permissions.email-templates.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (33, 'plugins::users-permissions.email-templates.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (34, 'plugins::users-permissions.advanced-settings.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (35, 'plugins::users-permissions.advanced-settings.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (36, 'admin::marketplace.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (37, 'admin::marketplace.plugins.install', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (38, 'admin::marketplace.plugins.uninstall', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (39, 'admin::webhooks.create', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (40, 'admin::webhooks.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (41, 'admin::webhooks.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (42, 'admin::webhooks.delete', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (43, 'admin::users.create', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (44, 'admin::roles.create', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (45, 'admin::users.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (46, 'admin::users.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (47, 'admin::users.delete', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (48, 'admin::roles.read', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (49, 'admin::roles.update', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (50, 'admin::roles.delete', NULL, NULL, '[]', 1, '2021-03-20 16:59:10', '2021-03-20 16:59:10');
INSERT INTO `strapi_permission` VALUES (56, 'plugins::content-manager.explorer.create', 'application::category.category', '[\"title\",\"status\"]', '[]', 1, '2021-03-21 14:13:53', '2021-03-21 14:13:53');
INSERT INTO `strapi_permission` VALUES (57, 'plugins::content-manager.explorer.read', 'application::category.category', '[\"title\",\"status\"]', '[]', 1, '2021-03-21 14:13:53', '2021-03-21 14:13:53');
INSERT INTO `strapi_permission` VALUES (58, 'plugins::content-manager.explorer.update', 'application::category.category', '[\"title\",\"status\"]', '[]', 1, '2021-03-21 14:13:53', '2021-03-21 14:13:53');
INSERT INTO `strapi_permission` VALUES (59, 'plugins::content-manager.explorer.delete', 'application::category.category', NULL, '[]', 1, '2021-03-21 14:13:53', '2021-03-21 14:13:53');
INSERT INTO `strapi_permission` VALUES (60, 'plugins::content-manager.explorer.publish', 'application::category.category', NULL, '[]', 1, '2021-03-21 14:13:53', '2021-03-21 14:13:53');
INSERT INTO `strapi_permission` VALUES (61, 'plugins::content-manager.explorer.create', 'application::product.product', '[\"title\",\"slug\",\"description\",\"price\",\"qty\",\"image\",\"is_featured\",\"category\",\"users\"]', '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (62, 'plugins::content-manager.explorer.create', 'plugins::users-permissions.user', '[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"products\"]', '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (63, 'plugins::content-manager.explorer.read', 'application::product.product', '[\"title\",\"slug\",\"description\",\"price\",\"qty\",\"image\",\"is_featured\",\"category\",\"users\"]', '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (64, 'plugins::content-manager.explorer.read', 'plugins::users-permissions.user', '[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"products\"]', '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (65, 'plugins::content-manager.explorer.update', 'application::product.product', '[\"title\",\"slug\",\"description\",\"price\",\"qty\",\"image\",\"is_featured\",\"category\",\"users\"]', '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (66, 'plugins::content-manager.explorer.update', 'plugins::users-permissions.user', '[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"products\"]', '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (67, 'plugins::content-manager.explorer.delete', 'application::product.product', NULL, '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (68, 'plugins::content-manager.explorer.publish', 'application::product.product', NULL, '[]', 1, '2021-03-21 14:28:36', '2021-03-21 14:28:36');
INSERT INTO `strapi_permission` VALUES (69, 'plugins::documentation.read', NULL, NULL, '[]', 1, '2021-03-21 15:19:52', '2021-03-21 15:19:52');
INSERT INTO `strapi_permission` VALUES (70, 'plugins::documentation.settings.update', NULL, NULL, '[]', 1, '2021-03-21 15:19:52', '2021-03-21 15:19:52');
INSERT INTO `strapi_permission` VALUES (71, 'plugins::documentation.settings.regenerate', NULL, NULL, '[]', 1, '2021-03-21 15:19:52', '2021-03-21 15:19:52');

-- ----------------------------
-- Table structure for strapi_role
-- ----------------------------
DROP TABLE IF EXISTS `strapi_role`;
CREATE TABLE `strapi_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `strapi_role_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `strapi_role_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strapi_role
-- ----------------------------
INSERT INTO `strapi_role` VALUES (1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_role` VALUES (2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2021-03-20 16:59:09', '2021-03-20 16:59:09');
INSERT INTO `strapi_role` VALUES (3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2021-03-20 16:59:09', '2021-03-20 16:59:09');

-- ----------------------------
-- Table structure for strapi_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `strapi_users_roles`;
CREATE TABLE `strapi_users_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strapi_users_roles
-- ----------------------------
INSERT INTO `strapi_users_roles` VALUES (1, 1, 1);
INSERT INTO `strapi_users_roles` VALUES (2, 1, 2);
INSERT INTO `strapi_users_roles` VALUES (3, 1, 3);

-- ----------------------------
-- Table structure for strapi_webhooks
-- ----------------------------
DROP TABLE IF EXISTS `strapi_webhooks`;
CREATE TABLE `strapi_webhooks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `url` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `headers` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `events` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upload_file
-- ----------------------------
DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE `upload_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alternativeText` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `width` int(11) NULL DEFAULT NULL,
  `height` int(11) NULL DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mime` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size` decimal(10, 2) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `previewUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload_file
-- ----------------------------
INSERT INTO `upload_file` VALUES (1, 'https://images.samsung.com/th/smartphones/galaxy-s21/buy/s21_family_kv_mo_img.jpg', '', '', 720, 720, '{\"thumbnail\":{\"name\":\"thumbnail_https://images.samsung.com/th/smartphones/galaxy-s21/buy/s21_family_kv_mo_img.jpg\",\"hash\":\"thumbnail_s21_family_kv_mo_img_ddd25a671d\",\"ext\":\".jpg\",\"mime\":\"image/webp\",\"width\":156,\"height\":156,\"size\":1.19,\"path\":null,\"url\":\"/uploads/thumbnail_s21_family_kv_mo_img_ddd25a671d.jpg\"},\"small\":{\"name\":\"small_https://images.samsung.com/th/smartphones/galaxy-s21/buy/s21_family_kv_mo_img.jpg\",\"hash\":\"small_s21_family_kv_mo_img_ddd25a671d\",\"ext\":\".jpg\",\"mime\":\"image/webp\",\"width\":500,\"height\":500,\"size\":5.07,\"path\":null,\"url\":\"/uploads/small_s21_family_kv_mo_img_ddd25a671d.jpg\"}}', 's21_family_kv_mo_img_ddd25a671d', '.jpg', 'image/webp', 8.23, '/uploads/s21_family_kv_mo_img_ddd25a671d.jpg', NULL, 'local', NULL, 1, 1, '2021-03-21 14:50:06', '2021-03-21 14:50:06');
INSERT INTO `upload_file` VALUES (2, 'Apple_announce-iphone12pro_10132020_big.jpg.large.jpg', '', '', 980, 551, '{\"thumbnail\":{\"name\":\"thumbnail_Apple_announce-iphone12pro_10132020_big.jpg.large.jpg\",\"hash\":\"thumbnail_Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":245,\"height\":138,\"size\":4.56,\"path\":null,\"url\":\"/uploads/thumbnail_Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502.jpg\"},\"medium\":{\"name\":\"medium_Apple_announce-iphone12pro_10132020_big.jpg.large.jpg\",\"hash\":\"medium_Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":422,\"size\":23.7,\"path\":null,\"url\":\"/uploads/medium_Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502.jpg\"},\"small\":{\"name\":\"small_Apple_announce-iphone12pro_10132020_big.jpg.large.jpg\",\"hash\":\"small_Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":281,\"size\":13.15,\"path\":null,\"url\":\"/uploads/small_Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502.jpg\"}}', 'Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502', '.jpg', 'image/jpeg', 34.69, '/uploads/Apple_announce_iphone12pro_10132020_big_jpg_large_22a9d95502.jpg', NULL, 'local', NULL, 1, 1, '2021-03-21 14:53:02', '2021-03-21 14:53:02');
INSERT INTO `upload_file` VALUES (3, 'itg-098.jpg', '', '', 696, 712, '{\"thumbnail\":{\"name\":\"thumbnail_itg-098.jpg\",\"hash\":\"thumbnail_itg_098_d5dfd04171\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":152,\"height\":156,\"size\":5.06,\"path\":null,\"url\":\"/uploads/thumbnail_itg_098_d5dfd04171.jpg\"},\"small\":{\"name\":\"small_itg-098.jpg\",\"hash\":\"small_itg_098_d5dfd04171\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":489,\"height\":500,\"size\":34.16,\"path\":null,\"url\":\"/uploads/small_itg_098_d5dfd04171.jpg\"}}', 'itg_098_d5dfd04171', '.jpg', 'image/jpeg', 59.55, '/uploads/itg_098_d5dfd04171.jpg', NULL, 'local', NULL, 1, 1, '2021-03-21 14:55:02', '2021-03-21 14:55:02');
INSERT INTO `upload_file` VALUES (4, 'itg-063.jpg', '', '', 735, 740, '{\"thumbnail\":{\"name\":\"thumbnail_itg-063.jpg\",\"hash\":\"thumbnail_itg_063_b46e64d412\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":155,\"height\":156,\"size\":4.61,\"path\":null,\"url\":\"/uploads/thumbnail_itg_063_b46e64d412.jpg\"},\"small\":{\"name\":\"small_itg-063.jpg\",\"hash\":\"small_itg_063_b46e64d412\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":497,\"height\":500,\"size\":19.62,\"path\":null,\"url\":\"/uploads/small_itg_063_b46e64d412.jpg\"}}', 'itg_063_b46e64d412', '.jpg', 'image/jpeg', 30.94, '/uploads/itg_063_b46e64d412.jpg', NULL, 'local', NULL, 1, 1, '2021-03-22 15:50:40', '2021-03-22 15:50:40');
INSERT INTO `upload_file` VALUES (5, 'com_5.jpg', '', '', 600, 550, '{\"thumbnail\":{\"name\":\"thumbnail_com_5.jpg\",\"hash\":\"thumbnail_com_5_5081e60295\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":170,\"height\":156,\"size\":4.45,\"path\":null,\"url\":\"/uploads/thumbnail_com_5_5081e60295.jpg\"},\"small\":{\"name\":\"small_com_5.jpg\",\"hash\":\"small_com_5_5081e60295\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":458,\"size\":24.15,\"path\":null,\"url\":\"/uploads/small_com_5_5081e60295.jpg\"}}', 'com_5_5081e60295', '.jpg', 'image/jpeg', 32.63, '/uploads/com_5_5081e60295.jpg', NULL, 'local', NULL, 1, 1, '2021-03-22 15:55:46', '2021-03-22 15:55:46');
INSERT INTO `upload_file` VALUES (6, 'com_1.jpg', '', '', 600, 550, '{\"thumbnail\":{\"name\":\"thumbnail_com_1.jpg\",\"hash\":\"thumbnail_com_1_e2bafbab1e\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":170,\"height\":156,\"size\":5.27,\"path\":null,\"url\":\"/uploads/thumbnail_com_1_e2bafbab1e.jpg\"},\"small\":{\"name\":\"small_com_1.jpg\",\"hash\":\"small_com_1_e2bafbab1e\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":458,\"size\":25.52,\"path\":null,\"url\":\"/uploads/small_com_1_e2bafbab1e.jpg\"}}', 'com_1_e2bafbab1e', '.jpg', 'image/jpeg', 33.31, '/uploads/com_1_e2bafbab1e.jpg', NULL, 'local', NULL, 1, 1, '2021-03-22 15:57:02', '2021-03-22 15:57:02');
INSERT INTO `upload_file` VALUES (7, 'Samsung-Galaxy-M51-scaled-1.jpg', '', '', 1200, 675, '{\"thumbnail\":{\"name\":\"thumbnail_Samsung-Galaxy-M51-scaled-1.jpg\",\"hash\":\"thumbnail_Samsung_Galaxy_M51_scaled_1_5cc471d948\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":245,\"height\":138,\"size\":6.73,\"path\":null,\"url\":\"/uploads/thumbnail_Samsung_Galaxy_M51_scaled_1_5cc471d948.jpg\"},\"large\":{\"name\":\"large_Samsung-Galaxy-M51-scaled-1.jpg\",\"hash\":\"large_Samsung_Galaxy_M51_scaled_1_5cc471d948\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":563,\"size\":53.6,\"path\":null,\"url\":\"/uploads/large_Samsung_Galaxy_M51_scaled_1_5cc471d948.jpg\"},\"medium\":{\"name\":\"medium_Samsung-Galaxy-M51-scaled-1.jpg\",\"hash\":\"medium_Samsung_Galaxy_M51_scaled_1_5cc471d948\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":422,\"size\":35.49,\"path\":null,\"url\":\"/uploads/medium_Samsung_Galaxy_M51_scaled_1_5cc471d948.jpg\"},\"small\":{\"name\":\"small_Samsung-Galaxy-M51-scaled-1.jpg\",\"hash\":\"small_Samsung_Galaxy_M51_scaled_1_5cc471d948\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":281,\"size\":19.12,\"path\":null,\"url\":\"/uploads/small_Samsung_Galaxy_M51_scaled_1_5cc471d948.jpg\"}}', 'Samsung_Galaxy_M51_scaled_1_5cc471d948', '.jpg', 'image/jpeg', 69.53, '/uploads/Samsung_Galaxy_M51_scaled_1_5cc471d948.jpg', NULL, 'local', NULL, 1, 1, '2021-03-22 15:58:06', '2021-03-22 15:58:06');
INSERT INTO `upload_file` VALUES (8, 'itg-181.jpg', '', '', 1308, 759, '{\"thumbnail\":{\"name\":\"thumbnail_itg-181.jpg\",\"hash\":\"thumbnail_itg_181_c303bd43fe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":245,\"height\":142,\"size\":7.46,\"path\":null,\"url\":\"/uploads/thumbnail_itg_181_c303bd43fe.jpg\"},\"large\":{\"name\":\"large_itg-181.jpg\",\"hash\":\"large_itg_181_c303bd43fe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":580,\"size\":51.19,\"path\":null,\"url\":\"/uploads/large_itg_181_c303bd43fe.jpg\"},\"medium\":{\"name\":\"medium_itg-181.jpg\",\"hash\":\"medium_itg_181_c303bd43fe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":435,\"size\":34.84,\"path\":null,\"url\":\"/uploads/medium_itg_181_c303bd43fe.jpg\"},\"small\":{\"name\":\"small_itg-181.jpg\",\"hash\":\"small_itg_181_c303bd43fe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":290,\"size\":20.3,\"path\":null,\"url\":\"/uploads/small_itg_181_c303bd43fe.jpg\"}}', 'itg_181_c303bd43fe', '.jpg', 'image/jpeg', 75.86, '/uploads/itg_181_c303bd43fe.jpg', NULL, 'local', NULL, 1, 1, '2021-03-31 17:17:23', '2021-03-31 17:20:08');

-- ----------------------------
-- Table structure for upload_file_morph
-- ----------------------------
DROP TABLE IF EXISTS `upload_file_morph`;
CREATE TABLE `upload_file_morph`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) NULL DEFAULT NULL,
  `related_id` int(11) NULL DEFAULT NULL,
  `related_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `field` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload_file_morph
-- ----------------------------
INSERT INTO `upload_file_morph` VALUES (1, 1, 1, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (2, 2, 2, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (4, 4, 5, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (5, 5, 6, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (7, 7, 8, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (12, 0, 14, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (13, 0, 15, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (14, 0, 16, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (15, 0, 17, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (16, 0, 23, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (17, 0, 24, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (18, 8, 25, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (19, 0, 26, 'products', 'image', 1);
INSERT INTO `upload_file_morph` VALUES (20, 0, 27, 'products', 'image', 1);

-- ----------------------------
-- Table structure for users-permissions_permission
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_permission`;
CREATE TABLE `users-permissions_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users-permissions_permission
-- ----------------------------
INSERT INTO `users-permissions_permission` VALUES (1, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (2, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (3, 'content-manager', 'collection-types', 'create', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (4, 'content-manager', 'collection-types', 'create', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (5, 'content-manager', 'collection-types', 'delete', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (6, 'content-manager', 'collection-types', 'delete', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (7, 'content-manager', 'collection-types', 'find', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (8, 'content-manager', 'collection-types', 'find', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (9, 'content-manager', 'collection-types', 'findone', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (10, 'content-manager', 'collection-types', 'findone', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (11, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (12, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (13, 'content-manager', 'collection-types', 'publish', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (14, 'content-manager', 'collection-types', 'publish', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (15, 'content-manager', 'collection-types', 'unpublish', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (16, 'content-manager', 'collection-types', 'unpublish', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (17, 'content-manager', 'collection-types', 'update', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (18, 'content-manager', 'collection-types', 'update', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (19, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (20, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (21, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (22, 'content-manager', 'components', 'findcomponents', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (23, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (24, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (25, 'content-manager', 'components', 'findcomponents', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (26, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (27, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (28, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (29, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (30, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (31, 'content-manager', 'relations', 'find', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (32, 'content-manager', 'relations', 'find', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (33, 'content-manager', 'single-types', 'createorupdate', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (34, 'content-manager', 'single-types', 'createorupdate', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (35, 'content-manager', 'single-types', 'delete', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (36, 'content-manager', 'single-types', 'find', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (37, 'content-manager', 'single-types', 'find', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (38, 'content-manager', 'single-types', 'publish', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (39, 'content-manager', 'single-types', 'publish', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (40, 'content-manager', 'single-types', 'delete', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (41, 'content-manager', 'single-types', 'unpublish', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (42, 'content-manager', 'single-types', 'unpublish', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (43, 'content-manager', 'uid', 'checkuidavailability', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (44, 'content-manager', 'uid', 'checkuidavailability', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (45, 'content-manager', 'uid', 'generateuid', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (46, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (47, 'content-manager', 'uid', 'generateuid', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (48, 'content-type-builder', 'builder', 'getreservednames', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (49, 'content-type-builder', 'builder', 'getreservednames', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (50, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (51, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (52, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (53, 'content-type-builder', 'components', 'createcomponent', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (54, 'content-type-builder', 'components', 'createcomponent', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (55, 'content-type-builder', 'components', 'deletecomponent', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (56, 'content-type-builder', 'components', 'getcomponent', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (57, 'content-type-builder', 'components', 'getcomponent', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (58, 'content-type-builder', 'components', 'getcomponents', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (59, 'content-type-builder', 'components', 'deletecomponent', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (60, 'content-type-builder', 'components', 'getcomponents', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (61, 'content-type-builder', 'components', 'updatecomponent', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (62, 'content-type-builder', 'components', 'updatecomponent', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (63, 'content-type-builder', 'connections', 'getconnections', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (64, 'content-type-builder', 'connections', 'getconnections', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (65, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (66, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (67, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (68, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (69, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (70, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (71, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (72, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (73, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (74, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (75, 'email', 'email', 'getsettings', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (76, 'email', 'email', 'getsettings', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (77, 'email', 'email', 'send', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (78, 'email', 'email', 'send', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (79, 'email', 'email', 'test', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (80, 'email', 'email', 'test', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (81, 'upload', 'upload', 'count', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (82, 'upload', 'upload', 'count', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (83, 'upload', 'upload', 'destroy', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (84, 'upload', 'upload', 'destroy', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (85, 'upload', 'upload', 'find', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (86, 'upload', 'upload', 'find', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (87, 'upload', 'upload', 'findone', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (88, 'upload', 'upload', 'findone', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (89, 'upload', 'upload', 'getsettings', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (90, 'upload', 'upload', 'getsettings', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (91, 'upload', 'upload', 'search', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (92, 'upload', 'upload', 'search', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (93, 'upload', 'upload', 'updatesettings', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (94, 'users-permissions', 'auth', 'callback', 1, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (95, 'upload', 'upload', 'updatesettings', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (96, 'upload', 'upload', 'upload', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (97, 'upload', 'upload', 'upload', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (98, 'users-permissions', 'auth', 'callback', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (99, 'users-permissions', 'auth', 'connect', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (100, 'users-permissions', 'auth', 'connect', 1, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (101, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (102, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (103, 'users-permissions', 'auth', 'forgotpassword', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (104, 'users-permissions', 'auth', 'forgotpassword', 1, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (105, 'users-permissions', 'auth', 'register', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (106, 'users-permissions', 'auth', 'register', 1, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (107, 'users-permissions', 'auth', 'resetpassword', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (108, 'users-permissions', 'auth', 'resetpassword', 1, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (109, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (110, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (111, 'users-permissions', 'user', 'count', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (112, 'users-permissions', 'user', 'count', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (113, 'users-permissions', 'user', 'create', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (114, 'users-permissions', 'user', 'create', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (115, 'users-permissions', 'user', 'destroy', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (116, 'users-permissions', 'user', 'destroy', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (117, 'users-permissions', 'user', 'destroyall', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (118, 'users-permissions', 'user', 'destroyall', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (119, 'users-permissions', 'user', 'find', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (120, 'users-permissions', 'user', 'find', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (121, 'users-permissions', 'user', 'findone', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (122, 'users-permissions', 'user', 'findone', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (123, 'users-permissions', 'user', 'me', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (124, 'users-permissions', 'user', 'me', 1, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (125, 'users-permissions', 'user', 'update', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (126, 'users-permissions', 'user', 'update', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (127, 'users-permissions', 'userspermissions', 'createrole', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (128, 'users-permissions', 'userspermissions', 'createrole', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (129, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (130, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (131, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (132, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (133, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (134, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (135, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (136, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (137, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (138, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (139, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (140, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (141, 'users-permissions', 'userspermissions', 'getrole', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (142, 'users-permissions', 'userspermissions', 'getrole', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (143, 'users-permissions', 'userspermissions', 'getroles', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (144, 'users-permissions', 'userspermissions', 'getroles', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (145, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (146, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (147, 'users-permissions', 'userspermissions', 'index', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (148, 'users-permissions', 'userspermissions', 'index', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (149, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (150, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (151, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (152, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (153, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (154, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (155, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (156, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (157, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (158, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (171, 'application', 'category', 'count', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (172, 'application', 'category', 'count', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (173, 'application', 'category', 'create', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (174, 'application', 'category', 'create', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (175, 'application', 'category', 'delete', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (176, 'application', 'category', 'delete', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (177, 'application', 'category', 'find', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (178, 'application', 'category', 'find', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (179, 'application', 'category', 'findone', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (180, 'application', 'category', 'findone', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (181, 'application', 'category', 'update', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (182, 'application', 'category', 'update', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (183, 'application', 'product', 'count', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (184, 'application', 'product', 'count', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (185, 'application', 'product', 'create', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (186, 'application', 'product', 'create', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (187, 'application', 'product', 'delete', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (188, 'application', 'product', 'delete', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (189, 'application', 'product', 'find', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (190, 'application', 'product', 'find', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (191, 'application', 'product', 'findone', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (192, 'application', 'product', 'findone', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (193, 'application', 'product', 'update', 1, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (194, 'application', 'product', 'update', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (195, 'documentation', 'documentation', 'deletedoc', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (196, 'documentation', 'documentation', 'deletedoc', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (197, 'documentation', 'documentation', 'getinfos', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (198, 'documentation', 'documentation', 'getinfos', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (199, 'documentation', 'documentation', 'index', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (200, 'documentation', 'documentation', 'index', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (201, 'documentation', 'documentation', 'login', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (202, 'documentation', 'documentation', 'login', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (203, 'documentation', 'documentation', 'loginview', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (204, 'documentation', 'documentation', 'loginview', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (205, 'documentation', 'documentation', 'regeneratedoc', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (206, 'documentation', 'documentation', 'regeneratedoc', 0, '', 2, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (207, 'documentation', 'documentation', 'updatesettings', 0, '', 1, NULL, NULL);
INSERT INTO `users-permissions_permission` VALUES (208, 'documentation', 'documentation', 'updatesettings', 0, '', 2, NULL, NULL);

-- ----------------------------
-- Table structure for users-permissions_role
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_role`;
CREATE TABLE `users-permissions_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users-permissions_role_type_unique`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users-permissions_role
-- ----------------------------
INSERT INTO `users-permissions_role` VALUES (1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', NULL, NULL);
INSERT INTO `users-permissions_role` VALUES (2, 'Public', 'Default role given to unauthenticated user.', 'public', NULL, NULL);

-- ----------------------------
-- Table structure for users-permissions_user
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_user`;
CREATE TABLE `users-permissions_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `resetPasswordToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `confirmationToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `confirmed` tinyint(1) NULL DEFAULT NULL,
  `blocked` tinyint(1) NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users-permissions_user_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users-permissions_user
-- ----------------------------
INSERT INTO `users-permissions_user` VALUES (1, 'iamsamit', 'iamsamit@email.com', 'local', '$2a$10$FC4W1ceXUsGG8130Nx0sE.zdGs4F1XJ.w05Mix68M3Aej58BdUIPu', NULL, NULL, 1, 0, 1, 1, 1, '2021-03-21 14:34:32', '2021-03-21 14:34:32');
INSERT INTO `users-permissions_user` VALUES (2, 'john', 'john@email.com', 'local', '$2a$10$hFsVQospZprNb9t5JxzXtubTdR5CKHlHOOQcqFQlnSeUFgqcxqACC', NULL, NULL, 1, 0, 1, 1, 1, '2021-03-21 14:35:17', '2021-03-21 14:35:17');
INSERT INTO `users-permissions_user` VALUES (3, 'sean', 'sean@email.com', 'local', '$2a$10$DOrS.U6i6V8HnDuEo6X0yOjJg/r8UgbDVspgesGFf304Cm5ZIwjRe', NULL, NULL, 1, 0, 1, 1, 1, '2021-03-21 14:35:39', '2021-03-21 14:35:39');
INSERT INTO `users-permissions_user` VALUES (4, 'user1', 'user1@email.com', 'local', '$2a$10$6IpF8azsiLWJNvhtHcls5u1iOAbaOtuWTi37.bI41.YaYoH9XBAhu', NULL, NULL, 1, NULL, 1, NULL, NULL, '2021-03-26 06:01:11', '2021-03-26 06:01:11');
INSERT INTO `users-permissions_user` VALUES (5, 'user2', 'user2@email.com', 'local', '$2a$10$AEeyoYLnSZhOoLxsWjqC3umIMyc7Z9kEb0mpAK3wJ9eSVa9H1ieO6', NULL, NULL, 1, NULL, 1, NULL, NULL, '2021-03-26 14:03:51', '2021-03-26 14:03:51');

SET FOREIGN_KEY_CHECKS = 1;
