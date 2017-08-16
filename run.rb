require "green_shoes"
require "json"

class All_json_actions
  def read_Json_String file
    file = File.read(file)
    parsedString = JSON.parse(file)
    return parsedString
  end

  def make_String_To_list

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

  end
end
