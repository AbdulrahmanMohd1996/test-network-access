import pandas as pd

df=pd.read_excel(r"G:\SW\test access\Windows\test.xlsx","Communication Matrix")
#print(df["Unnamed: 4"])


var=df["Unnamed: 4"]
#print(var)
#counter =0
#print(df["Unnamed: 4"])

for i in var:
    #print(list(var).index(i))
    if (int(list(var).index(i))>1):
        print(i)
   # counter = counter+1
#if ( i ):
 #        print(i)
        
    