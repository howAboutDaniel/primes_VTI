function p = primesPattern()
clc;
clear all;

% 1. blok
sp = [0,0;0,0];
for i = 1:100
    for j = i:-1:-i
        a = [j,i];
        sp = vertcat(sp,a);
    end
    for j = i:-1:-i
        a = [-i,j];
        sp = vertcat(sp,a);
    end
    for j = -i:1:i+1
        a = [j,-i];
        sp = vertcat(sp,a);
    end
    for j = -i:1:i
        a = [i+1,j];
        sp = vertcat(sp,a);
    end
end

% 2. blok
prime_array = 0;
a = [0,0];
sp_prime = a;
for j = 1:length(sp) 
    p = primeCheck(j);
    if(p == 1)
        prime_array = horzcat(prime_array,j);
    end
end

% 3. blok
prime_array = prime_array(2:length(prime_array));

for i = 1:length(prime_array)
    el = prime_array(1,i);
    sp_prime = vertcat(sp_prime,sp(el,:));
end

% display(prime_array) - zobrazí vygenerované prvočísla

% 4. blok
x1 = sp(:,1);
y1 = sp(:,2);
x = sp_prime(:,1);
y = sp_prime(:,2);
plot(x,y,'.');
axis equal;

end

function p = primeCheck(x)
p = 3;

if(x >= 3)
    for i = 2:x-1
        r = rem(x,i);
       if(r == 0)
           p = 0;
           break;
       end
    end
end
if (p == 3)
    p = 1;
end
end