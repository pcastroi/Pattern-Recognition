function xformed = standardize(rows)
%%take matrix and interpret data by rows, each col is one feature
m = mean(rows);
v = var(rows);

xformed = rows;
for idx = 1:length(rows(:,1))
    xformed(idx,:)=(rows(idx,:)-m)./(sqrt(v));
end