% dxi/dt = -Axi + (B-xi)[f(xi) +Ii] - xi *summation f(xk)
%steady state: xi = thetai * (b*summationI)/(A + summationI)
%theta I = Ii/summationI

Ioverall = [0.2, 0.6, 0.9, 0.6, 0.2, 0.1, 0.4, 0.8, 0.4, 0.1];
a = 1;
b = 3;
x = zeros(10000,10);
Ii = zeros(10000,10);
f = .25;
time = 0:0.001:10;
dt = 0.001;

for i = 1:1000
Ii(i,:) = [0.2 0.6 0.9 0.6 0.2 0.1 0.4 0.8 0.4 0.1];
end
figure(1)
plot(Ii(1,:))

%linear
    for current = 1:length(time) - 1
    x(current+1,:) = x(current,:) + dt.*((-a.*x(current,:)+ (b-x(current,:)).*(x(current,:)+ Ii(current,:)) - (x(current,:).*(sum(x(current,:))-x(current,:)))));
    end
figure(2)
mesh(x) 
title ('Linear Signal Function Impact On Neuronal Activity')
xlabel('Neuron #') 
ylabel('Time (ms)')
zlabel('Neuron Activity')
  
  %faster than linear
  for currT = 1:length(time)-1
            
            x(currT+1, :) = x(currT, :) + dt.*( (-a.*x(currT,:) + (b- x(currT,:)).*... 
                (x(currT,:).^2+Ii(currT,:)) - (x(currT,:) .* (sum(x(currT,:)) - x(currT,:)).^2))); 
              
  end 
 figure(3)
 mesh(x) 
title ('Faster Than Linear Signal Function Impact On Neuronal Activity')
xlabel('Neuron #') 
ylabel('Time (ms)')
zlabel('Neuron Activity')
  %slower than linear
for currT = 1:length(time)-1
            
            x(currT+1, :) = x(currT, :) + dt.*( (-a.*x(currT,:) + (b- x(currT,:)).*... 
                ((x(currT,:)./(x(currT,:)+f))+Ii(currT,:)) - (x(currT,:) .* ((sum((x(currT,:) - x(currT,:))./(x(currT,:)+f))))))); 
              
end 

figure(4)
mesh(x)
title ('Slower Than Linear Signal Function Impact On Neuronal Activity')
xlabel('Neuron #') 
ylabel('Time (ms)')
zlabel('Neuron Activity')

%sinusodial
 
 for currT = 1:length(time)-1
            
            x(currT+1, :) = x(currT, :) + dt.*( (-a.*x(currT,:) + (b- x(currT,:)).*... 
                (((x(currT,:)).^2./((x(currT,:)).^2+f))+Ii(currT,:)) - (x(currT,:) .* ((sum(x(currT,:).^2./((x(currT,:) - x(currT,:).^2+f)))))))); 
              
end 
figure(5)
mesh(x)
title ('Sigmoidal Signal Function Impact On Neuronal Activity')
xlabel('Neuron #') 
ylabel('Time (ms)')
zlabel('Neuron Activity')