warning('off','all')
#format long

n=298;       #sold tickets
p=0.03;      #probability of a passenger not boarding

pk=0;        #probability: exactly k passengers do not board    
Fk=0;        #probability: at most k passengers do not board


for k=0:10
    pk = (nchoosek(n,k))*((0.97)^(n-k))*((0.03)^(k));
    Fk += pk;
    if ((k ==2) | (k==5) | (k==10))
        Fk
    end
end


l=0
Fk=0;

while (Fk < 0.05)
    l+=1
    Fk=0;         #probability: at most k passengers do not board
    for k= 0:(l-1)
        pk = (nchoosek(n+l,k)*((0.97)^(n+l-k))*((0.03)^(k)));
        Fk += pk;
    end
end


Fk=1;

while (Fk > 0.95)
    n+=1
    Fk=0;         #probability: at most k passengers do board
    for k=0:298
        pk = (nchoosek(n,k)*((0.97)^(k))*((0.03)^(n-k)));
        Fk += pk;
    end
end
