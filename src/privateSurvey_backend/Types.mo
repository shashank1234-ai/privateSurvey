import Principal "mo:base/Principal";
module {

  public type SurveyConfig = {
    name : Text;
  };

  public type SurveyQuestions = {
    question : Text;
    typeOf : Text;
    options : [Text];

  };
  public type SurveyInstance = {

    Name: Text;
    questions : [SurveyQuestions];
  };

};
