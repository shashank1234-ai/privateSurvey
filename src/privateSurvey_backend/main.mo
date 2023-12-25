import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Types "Types";
import Cycles "mo:base/ExperimentalCycles";
import PrivateSurvey "PrivateSurvey";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Hash "mo:base/Hash";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Map "mo:base/HashMap";
import Text "mo:base/Text";
import SurveyConfig "Types";
actor {
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  type SurveyInstance = Types.SurveyInstance;
  type SurveyConfig = Types.SurveyConfig;
  type Name=Text;
  // let privateSurvey = HashMap.HashMap<Principal,Buffer.Buffer<PrivateSurvey.PrivateSurvey>>(1,Principal.equal,Principal.hash);
  let privateSurvey = Map.HashMap<Principal,SurveyConfig>(0,Principal.equal,Principal.hash);
  let privateSurveyQuestion = Map.HashMap<Principal,SurveyInstance>(0,Principal.equal,Principal.hash);
  let survey_array = Array;
  public shared(msg) func createSurvey(entry:SurveyConfig) {
    let callerId = msg.caller;
    // let surveys = privateSurvey.get(callerId);

    Cycles.add(100_000_000);
    // let _survey = await PrivateSurvey(_name);
    // let _survey = 
    // let _privatesurvey = Buffer.Buffer<Types.SurveyInstance>(1);
    // _privateSurvey.add(_survey);
    // let survey = await PrivateSurvey.PrivateSurvey(_name);
    privateSurvey.put(callerId,entry);
    // switch (surveys){
    //   case null {
    //     // let _survey = Buffer.Buffer<PrivateSurvey.PrivateSurvey>(1);
    //     // _survey.add(survey);
    //     // privateSurvey.put(callerId,_survey);
    //   };
    //   case(?v){
    //     v.add(survey);
    //     privateSurvey.put(callerId,v);
    //   }
    // }
  }; 

  public shared(msg) func createSurveyWithQs(entry:SurveyInstance) {
    let callerId = msg.caller;
    Cycles.add(100_000_000);
    privateSurveyQuestion.put(callerId,entry);
  };


    // public shared(msg) func getPrivateSurveys(): async SurveyInstance {
    //     let callerId = msg.caller;
    //     let _privateSurveyQuestion = privateSurveyQuestion.get(callerId); 
    //     switch (_privateSurveyQuestion) {
    //     //     case null {
    //     //         Debug.print("Empty Private Surveys");
                
    //     //     };
    //     case null{
    //       []
    //     };
    //         case (? v) {
    //             return v
    //         };
    //     }
    // };
// public shared(msg) func getSurveyByName(entry: { name : Text }): async [SurveyConfig] {
//   let callerId = msg.caller;
//   let _privateSurveys = privateSurvey.get(callerId);

//   switch (_privateSurveys) {
//     case null {
//       return [];
//     };
//     case (?v) {
//       // Filter surveys based on name
//     //   let filteredSurveys = Array.filter<SurveyConfig>(
//     //     func(survey: SurveyConfig) 
//     //     {
//     //       return survey.name == entry.name;
//     //     })(v);

//     //   return filteredSurveys;
//     // };
//     let size = [v.name];

//   };
// };

// };



};









// public func computeHash(input :Text) :async Text {
//   let hashBytes = Hash.hashSha256(String.toBytes(input));
//   return Blob.toText(hashBytes);
// };


