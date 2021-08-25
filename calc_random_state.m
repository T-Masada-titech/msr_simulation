function malStatus = calc_random_state(statusRange)
    malStatus = statusRange(1) + rand()*(statusRange(2) - statusRange(1));
end