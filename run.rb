require "green_shoes"
require "json"

class All_json_actions

# read the json string for later modification

  def read_Json_String file

    file = File.read(file)

    parsedString = JSON.parse(file)

    return parsedString

  end

# make the string to a more userfriendly list

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


        returnArray << tempString

        interval_value = interval_value + 1

      end
    end

    return returnArray
  end
end

class Inn_app_actions

  def set_data_in_fields options, elem
    elem.text = options[0]

    puts elem.text

  end

end

width = 600
height = 600
Shoes.app width: width, height: height do
  puts All_json_actions.new.read_Json_String("pages/page__index.json")
  flow do
  stack left: 0, width: 260, margin: 10 do

    stack do

      flow margin: 5 do
        para "parent"
        @new_elem_parent = edit_line
      end

      flow margin: 5 do
        para "type"
        @new_elem_type = list_box
        @new_elem_type.items = All_json_actions.new.read_Json_String("appData/typeList.json")
      end

      flow margin: 5 do
        para "id"
        @new_elem_id = edit_line
      end

      flow margin: 5 do
        para "class"
        @new_elem_class = edit_line
      end

      flow margin: 5 do
        para "innerHTML"
        @new_elem_innerHTML = edit_line
      end

      flow margin: 5 do
        @new_elem_submit = button "submit" do
          if @new_elem_parent.text.nil? || @new_elem_parent.text.empty?
            puts "parent field is empty"
          else
            if @new_elem_type.text.nil? || @new_elem_type.text.empty?
              puts "type field is empty"
            else
              puts "so this is it"
            end
          end
        end
      end

    end
  end

    stack left: 270, width: 260, margin: 10 do
      listArray = All_json_actions.new.make_String_To_list(["type", "id", "class"])

      para "current elements"
      $current_element_list = list_box
      $current_element_list.items = listArray
      $current_element_list_action = button "set as parent for new element" do

        tempList = All_json_actions.new.read_Json_String("pages/page__index.json")

        interval_value = 0

        while interval_value < tempList.length

          tempString = $current_element_list.text.split(" ")

          if tempList[interval_value]["type"] == tempString[0]

            if tempList[interval_value]["id"] == tempString[1]

              if tempString[2] == "null"
                if tempList[interval_value]["class"] == nil
                  Inn_app_actions.new.set_data_in_fields([tempList[interval_value]["parent"]], @new_elem_parent)
                  break
                end
              else
                Inn_app_actions.new.set_data_in_fields([tempString[0]])
                break
              end

            end

          end

          interval_value = interval_value + 1

        end
      end
      $current_element_list.choose(listArray[0])

    end
  end

end
