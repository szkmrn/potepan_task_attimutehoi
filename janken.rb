puts "あっち向いてホイをしましょう"

puts "じゃんけん・・・"


def janken 
    puts "0(グー),1(チョキ),2(パー),3(戦わない)"
        
    player_hand = gets.to_i
    program_hand = rand(3)
    
    if player_hand > 3
        puts "0(グー),1(チョキ),2(パー),3(戦わない)から数字を選んでください"
        @janken_result = "onemore"
    else
        
        jankens = ["グー","チョキ","パー","戦わない"]
            
        puts "ホイ"
        puts "------------------------"
        puts "あなた：#{jankens[player_hand]}を出しました"
        puts "相手　：#{jankens[program_hand]}を出しました"
        puts "------------------------"
        
        @face_over_result = false
            
        if player_hand == 3 || program_hand == 3
            puts"じゃんけんが放棄されました。"
            @janken_result = "out"
            
        else
            janken_combination = player_hand - program_hand 
            case janken_combination
                when -1,2
                    puts "じゃんけんに勝ちました"
                    #@authenticity = true
                    @face_over_result =""
                    @janken_result = "winner"  
                when 1,-2
                    puts "じゃんけんに負けました"
                    @janken_result = "loser"
                        
                when 0
                    puts "あいこ！もう一度"
                    @janken_result = "draw"
            end
                
        end 
    end
end

def face_over_lose
    puts "あっち向いて・・・"
    puts "顔を向けるの方向を選んでください"
    puts "0(上),1(下),2(右),3(左)"
        
    @player_face = gets.to_i
    @program_finger = rand(3)
    
    if @player_face > 3
        puts "予期せぬエラーが起きました。じゃんけんからやり直します"
        @janken_result = "onemore"
    else    
        facing_over = ["上","下","右","左"]
            
        puts "ホイ"
        puts "------------------------"
        puts "あなた：#{facing_over[@player_face]}を向きました"
        puts "相手：#{facing_over[@program_finger]}を指しました"
        puts "------------------------"
    end    
end

def face_over_win
    
    puts "あっち向いて・・・"
    puts "指の方向を選んでください"
    puts "0(上),1(下),2(右),3(左)"
        
    @player_finger = gets.to_i
    @program_face = rand(3)
    
    if @player_finger > 3
        puts "予期せぬエラーが起きました。じゃんけんからやり直します"
        @janken_result = "onemore"
    else   
        facing_overs = ["上","下","右","左"]
            
        puts "ホイ"
        puts "------------------------"
        puts "あなた：#{facing_overs[@player_finger]}を指しました"
        puts "相手：#{facing_overs[@program_face]}を向きました"
        puts "------------------------"
    end    
end

janken


while
    case @janken_result 
        when "onemore"
            puts "じゃんけん・・・"
            janken
        when "draw"
            puts "あいこで・・・"
            janken
        when "out" 
            puts "あっち向いてホイは終了です。"
        when "winner"
            face_over_win
            if @player_finger == @program_face
                puts "あなたの勝ちです！"
                @janken_result = ""
            else
                @janken_result = ""
                #puts "引き分けです"
                puts "もう一度！じゃんけん・・・"
                janken  
            
            end
            
        when "loser"
            face_over_lose
            if @player_face == @program_finger
                puts "あなたの負けです・・・"
                @janken_result = ""
            else
                @janken_result = ""
                #puts "引き分けです"
                puts "もう一度！じゃんけん・・・"
                janken
            end
    end
end

