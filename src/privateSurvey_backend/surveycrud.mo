import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Hash "mo:base/Hash";
import Types "Types";

actor Crud {
  type SurveyInstance = Types.SurveyInstance;
  type SurveyConfig = Types.SurveyConfig;

  var surveys = HashMap.HashMap<Nat,SurveyInstance>(1,Nat.equal,Hash.hash);
  stable var surveyId :Nat =0;
  public func createSurvey(survey: SurveyInstance) :async (){
    let id:Nat = surveyId;
    surveyId+=1;
    surveys.put(id,survey);
    ();
  };

  public query func getSurvey(id: Nat) :async ? SurveyInstance {
    let surveyRes:?SurveyInstance = surveys.get(id);
    surveyRes;
  };

  public query func getallSurveys() : async [(Nat,SurveyInstance)] {
    let surveyIters : Iter.Iter<(Nat,SurveyInstance)> = surveys.entries();
    let surveysarray : [(Nat,SurveyInstance)] = Iter.toArray(surveyIters);
    surveysarray;
  };

  public func updateSurvey(survey: SurveyInstance,id:Nat) :async Text {
    let surveyRes : ?SurveyInstance = surveys.get(id);
    switch(surveyRes){
      case(null){
        "Survey Doesnt Exist";
      };
      case(?currentSurvey){
        let updatedSurvey:SurveyInstance={
          Name = currentSurvey.Name;
          questions = currentSurvey.questions;
        };
        surveys.put(id,updatedSurvey);
        "Updated Successfully";
      }
    }
    // '';
  };
     public func removeSurvey (id : Nat) : async Text {
        
        //1. Auth

        //2. Query data.
        let surveyRes : ?SurveyInstance = surveys.get(id);
        
        //3. Validate if exists.
        switch (surveyRes) {
            case (null) {
                //3.1 Return "error".
                "You're trying to remove a non-existent post.";
            };
            case (_) {

        //5. Remove Post.
                ignore surveys.remove(id);
        //6. Return Success.
                "Post has been succesfuly removed!";
            };
        };
    };
}