import json


print("updating worker")

workerID = sys.argv[1]

with open("geyser-plugin-config.json", "r") as jsonFile:
    data = json.load(jsonFile)

data["worker_id"] = int(workerID)

with open("geyser-plugin-config.json", "w") as jsonFile:
    json.dump(data, jsonFile, indent=4,sort_keys=True)
