current_temp = 20
goal_temp = 45

def percept():
    return current_temp

def process(sense):
    if sense < goal_temp:
        return "HIGHER"
    else:
        return "STOP"

def act(action):
    global current_temp
    if action == "HIGHER":
        current_temp += 5
    else:
        return None
while True:
    sense = percept()
    action = process(sense)
    act(action)
    if action == "STOP":
        break
    import time
    time.sleep(0.5)
    print("Current temperature: ", current_temp)
print("Goal temperature reached: ", current_temp)