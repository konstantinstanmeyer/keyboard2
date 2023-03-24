class Score < ApplicationRecord
    # many-to-one relationship w/ user model
    belongs_to :user
    
    WORDS = ["activity","actually","add","address","air","all","allow","almost","become","bed","before","begin","behind","believe","care","career","carry","case","catch","cause","cell","difficult","dinner","disease","do","doctor","dog","down","drop","death","economy","edge","effect","eight","either","else","end","energy","expert","explain","eye","fast","fear","feel","feeling","few","field","former","four","free","friend","game","garden","gas","great","green","ground","group","grow","hang","happen","happy","hard","have","house","how","however","huge","human","include","indeed","interest","into","job","join","kind","kitchen","know","laugh","law","lawyer","leader","least","local","long","look","major","many","market","million","movie","miss","much","music","name","nation","nothing","notice","now","next","offer","office","option","or","order","outside","party","pass","past","pattern","pay","peace","place","position","possible","private","push","raise","range","ready","real","reality","region","relate","road","rock","sell","send","serve","situation","significant","sign","social","someone","study","stuff","style","tell","told","time","tiny","transfer","turn","twice","two","theory", "think","unit","until","usually","view","voice","visit","value","whether","when","wide","window","woman","word","year","young"]

end
