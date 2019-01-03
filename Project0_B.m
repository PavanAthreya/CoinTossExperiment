%Name: Pavan Athreya Narasimha Murthy
%USC ID: 9129210968
%E-mail: pavanatn@usc.edu
%Ph: +1(323)-684 5715
%Term: Fall 2018
%Course: EE511
%Professor: John Silvester

%Clear the variables and command window
clear all;
clc;

%Global variables for gettig the result of the experiments that runs 5000 times
global s1s;% = zeros(1,5000);
global s2s;% = zeros(1,5000);
global s3s;% = zeros(1,5000);
global s4s;% = zeros(1,5000);
%global sequences;% = ['AA'];
global heads_numbers;% = zeros(1,5000);
global iterations;% = zeros(1,5000);

%Function call to run the experiment 5000 times
for exp_number = 1:5000
    GenerateSequence(exp_number);
end

%Plotting all the six results captured
subplot(3,2,1);
plot(s1s);
title('Number of S1');
xlabel('Experiment number');
ylabel('Occurance of first time heads');
subplot(3,2,2);
plot(s2s);
title('Number of S2');
xlabel('Experiment number');
ylabel('Occurance of second time heads');
subplot(3,2,3);
plot(s3s);
title('Number of S3');
xlabel('Experiment number');
ylabel('Occurance of third time heads');
subplot(3,2,4);
plot(s4s);
title('Number of S4');
xlabel('Experiment number');
ylabel('Occurance of fourth time heads');
subplot(3,2,5);
plot(heads_numbers);
title('Number of heads');
xlabel('Experiment number');
ylabel('Total heads in the experiment');
subplot(3,2,6);
plot(iterations);
title('Iterations');
xlabel('Experiment number');
ylabel('Number of Iterations per experiment');

%Function to perform the experiment
function experiment = GenerateSequence(expNum)
global s1s;% = zeros(1,5000);
global s2s;% = zeros(1,5000);
global s3s;% = zeros(1,5000);
global s4s;% = zeros(1,5000);
%global sequences;% = ['AA'];
global heads_numbers;% = zeros(1,5000);
global iterations;% = zeros(1,5000);
    number_heads = 0;
    locations = zeros(1,4);
    temp_heads = 0;
    sequence = ['A'];
    iterationCount = 0;
    %Iterate until s4 is found
    while(1)
        iterationCount = iterationCount + 1;
        value = rand;
        if(value <= 0.5)
            sequence(1,iterationCount) = 'H';
            if(0 == locations(1,1))
                %s1
                locations(1,1) = iterationCount;
            end
            number_heads = number_heads + 1;
            temp_heads = temp_heads + 1;
            switch(temp_heads)
                case {2}
                    if(0 == locations(1,2))
                        %s2
                        locations(1,2) = iterationCount;
                    end
                case {3}
                    if(0 == locations(1,3))
                        %s3
                        locations(1,3) = iterationCount;
                    end
                case {4}
                    if(0 == locations(1,4))
                        %s4
                        locations(1,4) = iterationCount;
                    end
                    break;
            end
        else
            sequence(1,iterationCount) = 'T';
            temp_heads = 0;
        end
    end
    s1s(1,expNum) = locations(1,1);
    s2s(1,expNum) = locations(1,2);
    s3s(1,expNum) = locations(1,3);
    s4s(1,expNum) = locations(1,4);
%     sequences(1,expNum) = sequence;
    heads_numbers(1,expNum) = number_heads;
    iterations(1,expNum) = iterationCount;
end


