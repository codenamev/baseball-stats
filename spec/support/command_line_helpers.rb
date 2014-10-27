module CommandLineHelpers
  def stub_std_out
    $output = []

    STDOUT.stub(:puts) do |output|
      $output << output
      output = ''
    end
  end

  def reset_command_line
    $output = []
  end
end
