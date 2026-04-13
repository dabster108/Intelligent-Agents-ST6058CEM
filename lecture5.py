A = (0, 0)
B = (1, 0)


state = { 
    A: "Unknown",
    B: "Unknown",
    "location": None    
}

goal = { A: "Clean",
    B: "Clean"
}   


def update_state(memory,percept):
    location, status = percept
    memory["location"] = location
    memory[location] = status
    return memory

def possible_actions(state):
    location = state["location"]
    actions = ['NoOp']
    if state[location] == "Dirty":
        actions.append('Clean')
    if location == A:
        actions.append('Right')
    else:
        actions.append('Left')
    return actions



def predict_next_state(memory,action):
    predicted = memory.copy() # immutable 
    location = memory["location"]
    if action == " Clean":
        predicted[location] = "Clean" 
    elif action == "Right":
        predicted["location"] = B
    elif action == "Left":
        predicted["location"] = A
    return predicted



def utility(memory):
    score = 0
    if memory[A] == goal[A]:
        score += 10
    if memory[B] == goal[B]:
        score += 10
    return score


def expected_utility(memory, action):
    predicted = predict_next_state(memory, action)
    return utility(predicted)
    score = utility(predicted)
    if action in ["Left", "Right"]:
        score -= 1 # penlize movement
    if action == "NoOp" and not (predicted[A] == goal[A] and predicted[B] == goal[B]):
        score -= 5 # penlize no operation when not achieveing the goal 
    return score


def utility_based_agent(percent):
    global state
    state = update_state(state, percent)
    actions = possible_actions(state)
    best_action = max(actions, key=lambda action: expected_utility(state, action))
    return best_action

def run():
    print( utility_based_agent((A, "Dirty")), state )
    print( utility_based_agent((A, "Clean")), state )
    print( utility_based_agent((B, "Dirty")), state )
    print( utility_based_agent((B, "Clean")), state )

run()