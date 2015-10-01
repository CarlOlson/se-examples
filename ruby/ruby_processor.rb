
require 'parser/current'

class RubyProcessor < Parser::AST::Processor

  attr_reader :spans
  
  def initialize *args
    super
    @spans = []
  end
  
  def self.parse filename
    parser = Parser::CurrentRuby.new
    parser.diagnostics.consumer = Proc.new {}
    
    buffer = Parser::Source::Buffer.new(filename)
    buffer.read
    
    ast = parser.parse buffer
    processor = self.new
    processor.process ast
    processor
  end

  def process node
    add_span node if node
    super
  end
  
  private
  def add_span node, type = nil, args = nil
    loc = node.location.expression
    return if loc.nil?
    @spans << [ type || node.type, loc.begin_pos + 1, loc.end_pos + 1, *args ]
  end
  
end
