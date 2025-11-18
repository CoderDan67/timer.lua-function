-- timer.lua function created by CoderDan67
-- --HOW TO USE:--
-- 1. require the module where you want to use it (need dt aka delta time from love.update)
-- 2. to create a new timer, use: timer.newTimer("nameOfTimer") (the timer wont start unless its created)
-- 3. to check if the timer has reached a certain time, use: timer.wait
-- 4 if you want to clear a timer before it reaches the wait time, use: timer.clear("nameOfTimer")

local timer = {}
timer.list = {}

function timer.newTimer(name)
    table.insert(timer.list, 1, {name = name, time = 0})
end    

function timer.clear(name)
    for i = #timer.list, 1, -1 do
        if timer.list[i].name == name then
            table.remove(timer.list, i)
        end
    end     
end    

function timer.wait(dt, waitTime, name)
    for i = #timer.list, 1, -1 do
        if timer.list[i].name == name then
            timer.list[i].time = timer.list[i].time + dt
            if timer.list[i].time >= waitTime then
                timer.clear(timer.list[i].name)
                return true
            end
        end 
    end    
    return false 
end


return timer

