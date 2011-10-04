% num = (s + 0.1)(s + 10) = s² + 10.1s + 1
% den = (s + 1)(s² + s + 9) = s³ + 2s² + 10s + 9
num = {[1 10.1 1]};
den = {[1 2 10 9]};
H = tf(num, den);
%bode(H)
% pzmap(H);
% sgrid
% grid on

N = 8192;
f = 100;
Ts = 1/f;
Tmax = (N-1)*Ts;
t= 0:Ts:Tmax;
Xs = ones(3,N);
Y = ones(3,N);
size(Y)
index = 1;
for w=[1 3 5],
    x = sin(w*t);
    Xs(index,:) = x;
    [y, t] = lsim(H,x,t);
    Y(index,:) = y;
    index = index +1;
end
plot(t,Y(1,:), 'b',t, Xs(1,:),'r')
