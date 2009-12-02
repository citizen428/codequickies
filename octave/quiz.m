counter = 0;
number = ceil(10*rand(1));
 
fprintf('I am thinking a number between 1 and 10.\n');
while (guess = input('Guess a number: ')) ~= number
     counter += 1;
     if guess > number
          fprintf('Your guess is too high!\n');
     else
          fprintf('Your guess is too low!\n');
     end
end
 
fprintf('Congratulations! You guessed the correct number in %d shots. \n', counter+1);
