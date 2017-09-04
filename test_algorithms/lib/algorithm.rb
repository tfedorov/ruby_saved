# Basic implementation of alghoritm
module Algorithm
  #require 'pry'

  # Function returning array of strings which represents all
  # possible ways to form target from elements of dictionary.
  # The order in which combinations are
  # returned is irrelevant. Words from dictionary can be used multiple times.
  def find_combinations(dictionary, inp_target)
    main_result = []

    exec_recursive = lambda do |target, lam_res|
      dictionary.each do |dictionary_key|
        if target.empty?
          main_result << lam_res.strip
          return
        end

        if target.start_with? dictionary_key
          new_target = target[dictionary_key.length..-1]
          new_lam_res = lam_res + ' ' + dictionary_key
          exec_recursive.call(new_target, new_lam_res)
        end
      end
    end
    exec_recursive.call(inp_target, '')
    main_result
  end
end
