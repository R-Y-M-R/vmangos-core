DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230104101355');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230104101355');
-- Add your query below.


-- Assign despawn instantly flag to creatures.
UPDATE `creature_template` SET `gold_min`=0, `gold_max`=0, `loot_id`=0, `skinning_loot_id`=0, `flags_extra` = (`flags_extra` | 536870912) WHERE `entry` IN (2523, 2630, 3527, 3573, 3579, 3902, 3903, 3904, 3906, 3907, 3908, 3909, 3911, 3912, 3913, 3968, 4277, 5873, 5874, 5879, 5913, 5919, 5920, 5921, 5922, 5923, 5924, 5925, 5926, 5927, 5929, 5950, 6012, 6016, 6017, 6066, 6107, 6110, 6111, 6112, 6245, 6246, 6386, 7366, 7367, 7368, 7381, 7382, 7384, 7398, 7399, 7400, 7402, 7403, 7412, 7413, 7414, 7415, 7416, 7423, 7424, 7425, 7464, 7465, 7466, 7467, 7468, 7469, 7483, 7484, 7486, 7487, 7555, 7785, 7844, 7845, 8510, 9637, 9658, 9687, 9688, 9689, 9707, 10183, 10217, 10467, 10482, 10557, 10716, 11100, 11101, 11144, 11258, 11439, 12141, 13838, 14081, 14101, 14386, 14396, 14397, 14511, 14512, 14513, 14514, 14662, 14663, 14664, 14666, 14870, 14965, 14986, 14989, 15009, 15112, 15117, 15141, 15163, 15261, 15304, 15363, 15463, 15464, 15537, 15538, 15622, 15803, 16385, 16419, 16420, 16697, 16775, 16776, 16777, 16778, 18078);
DELETE FROM `creature_loot_template` WHERE `entry`=10482;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;