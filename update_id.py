import json


print("updating worker")

keypath  = sys.argv[1]
workerID = sys.argv[2]

with open("geyser-plugin-config.json", "r") as jsonFile:
    data = json.load(jsonFile)

data["keypath"] = str(keypath)
data["worker_id"] = int(workerID)

with open("geyser-plugin-config.json", "w") as jsonFile:
    json.dump(data, jsonFile, indent=4,sort_keys=True)
