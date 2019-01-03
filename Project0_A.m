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

%Get number of coin flips to be performed from the user
number_toss = input('Enter the number of tosses: ');

%Initialize variable to keep tracks of the results needed
number_heads = 0;
longest_heads = 0;
temp_heads = 1;
list_of_consecutive_heads = zeros(1,number_toss);

%Random values within 0 and 1 for our coin flip experiments
randomSamples = rand(1,number_toss);

%Looping the random values to get our experiment result
for sample = 1:number_toss
    %For this experiment we are considering <= 0.5 as Head and > 0.5 as Tails
    if(randomSamples(sample) <= 0.5)
        number_heads = number_heads + 1;
        if(sample < number_toss)
            if(randomSamples(sample) < 0.5 && randomSamples(sample + 1) < 0.5)
                %calculating the consecutive head sequence
                temp_heads = temp_heads + 1;
            else
                list_of_consecutive_heads(1,sample) = temp_heads;
                temp_heads = 1;
            end
        end
    end
end

%Get the longest head sequence from the array with head sequece count
longest_heads = max(list_of_consecutive_heads);

%display all the results needed
disp('Number of heads: ');
disp(number_heads);
disp('Length of the longest run: ');
disp(longest_heads);