# Provide functionality for lessons management
class LessonsRepository < MongoidDocumentRepository::Base
  # @type [Hash] Required entities and types
  REQUIRED_ENTITIES_AND_KEYS = {
      teacher: 'teacher_id',
      group: 'group_id'
  }.freeze

  # @param [Hash] params Params for lessons getting
  def self.by_params(params)
    params = params.find do |enetity_id_key, value|
      REQUIRED_ENTITIES_AND_KEYS.key enetity_id_key
    end
    entity_id_key, entity_id_value = params
    entity = REQUIRED_ENTITIES_AND_KEYS.key entity_id_key
    result = send("by_#{entity}", entity_id_value)
    result
  end

  def self.by_teacher(teacher_id)
    model.where(:teacherids.in => [teacher_id]) if teacher_id
  end

  def self.by_group(group_id)
    model.where(:classids.in => [group_id]) if group_id
  end
end