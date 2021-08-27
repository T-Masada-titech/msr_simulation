clear
close
T = 10;
N = 10;
malN = 1;

state = zeros(N, T+1);
stateRange = [0 5];
for i = 1:N
    state(i, 1) = calc_random_state(stateRange);
end

weight = magic(10);
weight = weight(:, [1 3 5 2 6 8 9 7 4 10]);
weight = weight([2 4 6 3 8 9 10 1 5 7], :);

for i = 1:T
    state(:, i+1) = msr_update(state(:, i), weight, malN);
    
    for k = 1:malN
        state(k, i+1) = calc_random_state(stateRange);
    end
end

hold on
for i = 1:N
    plot(0:T, state(i, :))
end
xlabel('time')
ylabel('state')
