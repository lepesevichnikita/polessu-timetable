json.card do
  json.period card.period
  json.subject card.lesson.subject.name
  json.classroom card.classrooms.first.short
  json.teacher card.lesson.teachers.first.name
  json.part card.lesson.parts.first.name if card.lesson.partids.count > 0
end
