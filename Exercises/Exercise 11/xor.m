function r = xor(input1,input2)

vctr=[input1,input2,1];

w1=[15 15 -15];
w2=[-15 -15 25];
w3=[15 15 -25];

if (w1*vctr'<0)
    o1=0;
else
    o1=1;
end

if (w2*vctr'<0)
    o2=0;
else
    o2=1;
end

if (w3*[o1;o2;1])
    r=0;
else
    r=1;
end

end
