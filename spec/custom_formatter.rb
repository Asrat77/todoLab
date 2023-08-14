require 'rspec/core/formatters/base_text_formatter'

class CustomFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def dump_failures(notification)
    failed_examples = notification.failed_examples
    return if failed_examples.empty?

    output.puts
    output.puts "Failures:"

    failed_examples.each_with_index do |example, index|
      output.puts
      output.puts "#{index + 1}) #{example.full_description}"
      output.puts example.execution_result.exception.to_s
    end
  end
end
