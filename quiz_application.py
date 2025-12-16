import tkinter
import clips
from functools import partial
rules_filepath = "./rules.clp"
question = ""
curr_fact = ""
possible_answers = ""
buttons = []

#clips setup
clips_env = clips.Environment()
clips_env.load(rules_filepath)

#gui setup
app = tkinter.Tk()
app.title("Which SciFI movie should I watch on Netflix")
#Tutaj moze dobierac do rozdzielczosci ekranu
app.geometry("250x150")

#elements ssetup
title = tkinter.Label(app,text="QUESTION WILL BE SHOWN HERE")
title.grid(row=0,column=0)
# text_input = tkinter.Text(app,width=30,height=3)
# text_input.grid(row=1,column=0)
# text_output = tkinter.Label(app,text="OUTPUT WILL BE HERE")
# text_output.grid(row=4,column=0)



#button function
def button_press(answer = ''):
    global question, curr_fact, possible_answers, question_id, buttons
    
    #czyszczenie przyciskow
    for i in range(len(buttons)):
        buttons[i].destroy()
    buttons = []
    
    if(answer != ''):
        print("asserting:",'('+curr_fact+' '+answer+')')
        clips_env.assert_string('('+curr_fact+' '+answer+')')
    
    clips_env.run()
    for i in clips_env.facts():
        fact_formatted = str(i)
        fact_formatted = fact_formatted.replace('(','')
        fact_formatted = fact_formatted.replace(')','')
        fact_formatted = fact_formatted.split(' ')
        if fact_formatted[0] == "question":
            question = fact_formatted[1].replace('_',' ')
            curr_fact = fact_formatted[2]
            possible_answers = fact_formatted[3].split(':')
            break
        elif fact_formatted[0] == "answer":
            title.config(text=fact_formatted[1])
            print('------FACTS--------')
            for j in clips_env.facts():
                print(j)
            return
        else:
            continue
    title.config(text=question)
    for i in range(len(possible_answers)):
        button = tkinter.Button(app,text=possible_answers[i],width=25,command= partial(button_press,possible_answers[i]))
        button.grid(row=4+i)
        buttons.append(button)
    # input = text_input.get("1.0",'end-1c')
    # print(input)
    # clips_env.assert_string(input)
    

button = tkinter.Button(app,text="START",width=25,command=button_press)
button.grid(row=3,column=0)
buttons.append(button)


#start app
app.mainloop()