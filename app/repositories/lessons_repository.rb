# Provide functionality for lessons management
class LessonsRepository < MongoidDocumentRepository::Base
  # @type [Hash] Required entities and types
  REQUIRED_ENTITIES_AND_KEYS = {
    teacher: 'teacher_id',
    group: 'group_id'
  }.freeze

  # @param [Hash] params Params for lessons getting
  def self.by_params(params)
    entity_id_name, entity_id_value = extract_params(params)
    entity = entity_name(entity_id_name)
    result = send("by_#{entity}", entity_id_value)
    result
  end

  # @param [String, Integer, BSON::ObjectId] teacher_id Id of lessons teachers
  # @return [Mongoid::Criteria] Criteria of select
  def self.by_teacher(teacher_id)
    model.where(:teacherids.in => [teacher_id]) if teacher_id
  end

  # @param [String, Integer, BSON::ObjectId] group_id Id of lessons groups
  # @return [Mongoid::Criteria] Criteria of select
  def self.by_group(group_id)
    model.where(:classids.in => [group_id]) if group_id
  end

  private

  # @param [Hash] params Params for extract
  # @return [Array] Extracted param
  def self.extract_params(params)
    entity_id_name, entity_id_key = params.find do |enetity_id_key, _value|
      REQUIRED_ENTITIES_AND_KEYS.key enetity_id_key
    end
    [entity_id_name, entity_id_key]
  end

  # @param [String, Symbol] entity_id_name Entity id name
  # @return [Symbol] Entity name by id name
  def self.entity_name(entity_id_name)
    REQUIRED_ENTITIES_AND_KEYS.key entity_id_name
  end
end
