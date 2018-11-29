json.card do
  json.period card.period
  json.subject card.lesson.subject.name
  json.classroom card.classrooms.first.short if card.classrooms.count.positive?
  json.teacher card.lesson.teachers.first.name if card.lesson.teachers.count
                                                      .positive?
  json.part card.lesson.parts.first.name if card.lesson.partids.count.positive?
end
