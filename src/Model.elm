module Model exposing (..)


questions : List Question
questions =
    [ Question "Who is Simba’s mother?" [ ( "Nala", False ), ( "Sarabi", True ), ( "Zazu", False ) ] "https://lumiere-a.akamaihd.net/v1/images/q1_abe254ac.jpeg?region=5%2C0%2C740%2C400"
    , Question "Finish the Simba quote: “Oh I just can’t wait to be _____”" [ ( "5 years old!", False ), ( "Me", False ), ( "King", True ) ] "https://lumiere-a.akamaihd.net/v1/images/q2_c8fca13b.jpeg?region=5%2C0%2C740%2C400"
    , Question "Who finds Simba in the desert and rescues him?" [ ( "Scar and Ed", False ), ( "Mufasa and Scar", False ), ( "Timon and Pumbaa", True ) ] "https://lumiere-a.akamaihd.net/v1/images/q3_42783702.jpeg?region=5%2C0%2C740%2C400"
    , Question "How are Simba and Scar related? " [ ( "Scar is Simba’s best friend", False ), ( "Scar is Simba’s pet beetle", False ), ( "Scar is Simba’s uncle", True ) ] "https://lumiere-a.akamaihd.net/v1/images/q4_6e44e69b.jpeg?region=5%2C0%2C740%2C400"
    , Question "How does Mufasa appear to Simba later on in The Lion King?" [ ( "In a piece of fruit", False ), ( "In a dream", True ), ( "In the sand", False ) ] "https://lumiere-a.akamaihd.net/v1/images/q5_70e67ce1.jpeg?region=5%2C0%2C740%2C400"
    ]


type alias Answer =
    ( String, Bool )


type alias Question =
    { text : String, answers : List Answer, img : String }


type alias Model =
    { questions : List Question, isAnswered : Bool, userAnswer : Answer, correctCount : Int }


model : Model
model =
    { questions = questions
    , isAnswered = False
    , userAnswer = ( "", False )
    , correctCount = 0
    }
