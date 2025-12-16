import sys
sys.path.append("lib")

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
screen_width = app.winfo_screenwidth()
screen_height = app.winfo_screenheight()
app.geometry(str(screen_width // 2)+'x'+str(screen_height // 2))
app.configure(bg='lavender')

#elements ssetup
title = tkinter.Label(app,text="PRESS START TO BEGIN",anchor='center',bg='lavender'
                      ,font=('comicsansms',22,'bold'))
title.place(relx=0.5,rely=0.5,anchor='center')
#title.place(x=screen_width//4,y=screen_height//4,anchor='center')
# text_input = tkinter.Text(app,width=30,height=3)
# text_input.grid(row=1,column=0)

#button function
def button_press(answer = ''):
    global question, curr_fact, possible_answers, buttons
    
    #czyszczenie przyciskow
    for i in range(len(buttons)):
        buttons[i].destroy()
    buttons = []

    if(answer != ''):
        print("asserting:",'('+curr_fact+' '+answer+')')
        clips_env.assert_string('('+curr_fact+' '+answer+')')

    clips_env.run()
    for i in clips_env.facts():
        fact_formatted = str(i).replace("(", "").replace(")", "").split(" ")
        if fact_formatted[0] == "question":
            question = fact_formatted[1].replace('_',' ')
            curr_fact = fact_formatted[2]
            possible_answers = fact_formatted[3].split(':')
            break
        elif fact_formatted[0] == "answer":
            title.config(text="Answer:\n"+fact_formatted[1].replace('_',' '))
            print('------FACTS--------')
            for j in clips_env.facts():
                print(j)
            return
        else:
            continue
    title.config(text=question.replace('_',' '))

    starter_x = 0.5 - (len(possible_answers)*0.125)
    for i in range(len(possible_answers)):
        button = tkinter.Button(app,text=possible_answers[i].replace('_',' '),width=18,command= partial(button_press,possible_answers[i])
                                ,activebackground='blue',activeforeground='white',
                              cursor='hand1',overrelief='groove',bg='gold',bd=10,font='comicsansms')
        button.place(relx=starter_x,rely=0.95,anchor='w')
        buttons.append(button)
        starter_x += 0.25
    # input = text_input.get("1.0",'end-1c')
    # print(input)
    # clips_env.assert_string(input)

#reset method
def reset_button():
    global question, curr_fact, possible_answers, buttons
    #czyszczenie przyciskow
    for i in range(len(buttons)):
        buttons[i].destroy()
    buttons = []

    question = ""
    curr_fact = ""
    possible_answers = ""
    clips_env.reset()
    title.config(text="PRESS START TO BEGIN")
    button_start = tkinter.Button(app,text="START",width=25,command=button_press
                                  ,activebackground='blue',activeforeground='white',
                              cursor='hand1',overrelief='groove',bg='gold',bd=10,font='comicsansms')
    button_start.place(relx=0.5,rely=0.95,anchor='center')
    buttons.append(button_start)


button_start = tkinter.Button(app,text="START",width=25,command=button_press
                              ,activebackground='blue',activeforeground='white',
                              cursor='hand1',overrelief='groove',bg='gold',bd=10,font='comicsansms')
button_start.place(relx=0.5,rely=0.95,anchor='center')

button_reset = tkinter.Button(app,text="RESET",width=25,command=reset_button
                              ,activebackground='red',activeforeground='white',
                              cursor='hand1',overrelief='groove',bg='tomato',bd=10,font='comicsansms')
button_reset.place(relx=0,rely=0)
buttons.append(button_start)

#start app
app.mainloop()