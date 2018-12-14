# Polessu Timetable API

This project provide public RESTFull API for getting timetable by groups and teachers on day and week

Scrapper of timetable from http://www.polessu.by/ruz/tt.xml is placed in app/lib/timetable

* api/v1/teachers - All teachers
* api/v1/groups - All groups
* api/v1/teachers/:teacher_id - Teacher by id
* api/v1/groups/:group_id - Group by id
* api/v1/teachers/:teacher_id/cards?definition={day|week}&period={today|tomorrow|this|next|} - Cards by teacher and period of definition
* api/v1/groups/:group_id/cards?definition={day|week}&period={today|tomorrow|this|next|} - Cards by group and period of definition

Services for another resources are placed in app/services

Repositories for quering mongoid collections by model name are placed in app/repositories

You can check this project on http://polessu-timetable.herokuapp.com
