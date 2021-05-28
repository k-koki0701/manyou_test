# README

# usersテーブル
|Column|Type|Options|
|name|string||
|email|string||
|password|string||
|password confirmation|string||

# tasksテーブル
|Column|Type|Options|
|task_name|string||
|task_detail|string||
|end_period|string||
|status|string||
|priority|string||
|user_id|integer||

# labelsテーブル
|Column|Type|Options|
|label_name|string||

# task_labelsテーブル
|Column|Type|Options|
|task_id|integer||
|label_id|integer||
