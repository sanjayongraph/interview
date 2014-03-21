// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .


  // function addFields(){
  //           // Number of inputs to create
  //           var number = document.getElementById("option").value;
  //           // Container <div> where dynamic content will be placed
  //           var container = document.getElementById("container");
  //           // Clear previous contents of the container
  //           while (container.hasChildNodes()) {
  //               container.removeChild(container.lastChild);
  //           }
            
  //           for (i=0;i<number;i++)
  //           {
  //               // Append a node with a random text
  //               container.appendChild(document.createTextNode("Option " + (i+5)));
  //               // Create an <input> element, set its type and name attributes
  //               var input = document.createElement("input");
  //               input.type = "text";
  //               i=i+5;
  //               input.name = "question[option" + i+"]";
  //               container.appendChild(input);
  //               // Append a line break 
  //               i=i-5;
  //               container.appendChild(document.createElement("br"));
  //           }
  //       }


  $(document).ready(function(){
    
    var counter = 2;
 
    $("#addButton").click(function () {
 
  if(counter>10){
            alert("Only 10 textboxes allow");
            return false;
  }   
 
  var newTextBoxDiv = $(document.createElement('div'))
       .attr("id", 'TextBoxDiv' + counter);
 
  newTextBoxDiv.after().html('<label>Option'+ counter + '</label>' +
        '<input type="text" name="question[option' + counter + ']'+
        '" id="question_option' + counter + '" value="" >' +'<input type="checkbox" name="question[answer' + counter + ']'+
        '" id="question_answer' + counter + '" >');
 
  newTextBoxDiv.appendTo("#TextBoxesGroup");
 
 
  counter++;
     });
 
     $("#removeButton").click(function () {
  if(counter==1){
          alert("No more option field to remove");
          return false;
       }   
 
  counter--;
 
        $("#TextBoxDiv" + counter).remove();
 
     });
 
       });