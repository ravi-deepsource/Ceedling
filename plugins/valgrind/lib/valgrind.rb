require 'ceedling/plugin'
require 'ceedling/constants'
class Valgrind < Plugin

  attr_reader :config

  def setup
    @config = {
      :track_origins    => ((defined? VALGRIND_TRACK_ORIGINS   ) ? VALGRIND_TRACK_ORIGINS    : true),
      :leak_check       => ((defined? VALGRIND_LEAK_CHECK      ) ? VALGRIND_LEAK_CHECK       : :full),
      :show_leak_kinds  => ((defined? VALGRIND_SHOW_LEAK_KINDS ) ? VALGRIND_SHOW_LEAK_KINDS  : :all),
      :errors_for_leaks => ((defined? VALGRIND_ERRORS_FOR_LEAKS) ? VALGRIND_ERRORS_FOR_LEAKS : :all),
      :error_exitcode   => ((defined? VALGRIND_ERROR_EXITCODE  ) ? VALGRIND_ERROR_EXITCODE   : 10)
    }
    @plugin_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end

  def pre_test_fixture_execute(arg_hash)
    cmd = 'valgrind'
    cmd += " --track-origins=#{@config[:track_origins] ? 'yes' : 'no'}"
    cmd += " --leak-check=#{@config[:leak_check].to_s}"
    cmd += " --show-leak-kinds=#{@config[:show_leak_kinds].to_s}"
    cmd += " --errors-for-leak-kinds=#{@config[:errors_for_leaks].to_s}"
    cmd += " --error-exitcode=#{@config[:error_exitcode].to_s}"
    shell_result = @ceedling[:tool_executor].exec(cmd, arg_hash[:executable])
    #TODO Store Away Results
    arg_hash[:shell_result] = shell_result
  end

  def pre_build
    #TODO clear results
  end

  def post_build
    #TODO Summarize Results
  end

  def post_error
    #TODO Summarize Results
  end

  private

end

