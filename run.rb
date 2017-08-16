require "green_shoes"
require "json"

class All_json_actions
  def read_Json_String file
    file = File.read(file)
    parsedString = JSON.parse(file)
    return parsedString
  end

  def make_String_To_list options
    parsedString = read_Json_String("pages/page__index.json")
    returnArray = []
    if options.kind_of?(Array)
      interval_value = 0

      while interval_value < parsedString.length

        tempString = ""
        inloop_interval_value = 0

        while inloop_interval_value < options.length

          if parsedString[interval_value][options[inloop_interval_value]] == nil

            tempString << "null "

          else
            tempString << parsedString[interval_value][options[inloop_interval_value]] << " "
          end

          inloop_interval_value = inloop_interval_value + 1

        end

        # tempString << parsedString[interval_value][options[0]] << " " << parsedString[interval_value][options[1]] << " " << parsedString[interval_value][options[2]]

        returnArray << tempString

        interval_value = interval_value + 1

      end
    end

    return returnArray
  end
end

width = 600
height = 600
Shoes.app width: width, height: height do
  puts All_json_actions.new.read_Json_String("pages/page__index.json")
  flow margin: 10 do

    stack do

      flow do
        para "parent"
        @new_elem_parent = edit_line
      end

      flow do
        para "type"
        @new_elem_type = edit_line
      end

      flow do
        para "id"
        @new_elem_id = edit_line
      end

      flow do
        para "class"
        @new_elem_class = edit_line
      end

      flow do
        para "innerHTML"
        @new_elem_innerHTML = edit_line
      end

    end

    stack do

      flow do
        puts All_json_actions.new.make_String_To_list(["type", "id", "class"])
        para "current elements"
        $current_element_list = list_box
        $current_element_list.items = All_json_actions.new.make_String_To_list(["type", "id", "class"])
        $current_element_list_action = button "set as parent for new element" do
          puts "awesome"
        end
      end

    end

  end
end
