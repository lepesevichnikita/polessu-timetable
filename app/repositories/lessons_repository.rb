# Provide functionality for lessons management
class LessonsRepository < SingleModelRepository::Base

  def self.by_params(params)
    res = by_teacher(params['teacher_id']) || by_group(params['group_id'])
    res
  end

  def self.by_teacher(teacher_id)
    model.where(:teacherids.in => [teacher_id]) if teacher_id
  end

  def self.by_group(group_id)
    model.where(:classids.in => [group_id]) if group_id
  end
end