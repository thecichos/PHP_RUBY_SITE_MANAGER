<script src="resources\Javascript\jquery-3.2.0.min.js"></script>
<script src="resources\Javascript\build.js"></script>
<?php

  class Jquerybuild
  {
    function __build($jsonString)
    {
      for ($i=0; $i < count($jsonString); $i++) {
        $type = $jsonString[$i]["type"];
        $id = $jsonString[$i]["id"];
        $class = $jsonString[$i]["class"];
        $innerHTML = $jsonString[$i]["innerHTML"];
        $parent = $jsonString[$i]["parent"];
        echo "build('$type', '$id', '$class', '$innerHTML', '$parent') \n";
      }

    }
  }

  class GetData
  {
    function __getJsonData($page)
    {
      chdir("pages");
      $file = file_get_contents("$page.json");
      $fileParsed = json_decode($file, true);
      return $fileParsed;
    }
  }
 ?>

 <script type="text/javascript">
   $(document).ready(function() {
     <?php      Jquerybuild::__build(GetData::__getJsonData("page__index"));       ?>
   });
 </script>
