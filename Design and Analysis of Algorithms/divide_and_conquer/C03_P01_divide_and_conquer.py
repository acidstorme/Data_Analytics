import csv

class System:
    def __init__(self):
        self.sensors_list = list()
        self.sensor_mapping_list = list()
        self.master_node_list = list()
        
    def config_system(self, file):
        data_file = open(file, 'r')
        reader = csv.DictReader(data_file)
        for row in reader:
            node_id = row['Node ID']
            type = row['Type']
            master_node_id = row['Master Node ID']
            
            if type == 'Master':
                self.master_node_list.append(int(master_node_id))
            elif type == "Sensor":
                self.sensors_list.append(int(node_id))
                self.sensor_mapping_list.append(int(master_node_id))
                
        
    def SensorAssignedCount(self, mapping_list, l, r, OverloadSensor):
        count = 0
        for i in range(l, r+1):
            if (mapping_list[i] == OverloadSensor): 
                count +=  1
        return count
    
    def OverloadNodeHelper(self,l, r):
        if l == r:
            return self.sensor_mapping_list[r]
        
        if l < r:
            mid = (r+l)//2

            X = self.OverloadNodeHelper(l, mid)
            Y = self.OverloadNodeHelper(mid+1, r)

        if X==Y:
            return X


        Xcount = self.SensorAssignedCount(self.sensor_mapping_list, l, r, X)
        Ycount = self.SensorAssignedCount(self.sensor_mapping_list, l, r, Y)

        if r-l+1 == len(self.sensor_mapping_list):
            if Xcount >= len(self.sensor_mapping_list)//2:
                return X
            elif Ycount >= len(self.sensor_mapping_list)//2:
                return Y
            return None

        if Xcount > Ycount:
            return X
        else:
            return Y
       
        
    def getOverloadedNode(self):
        return self.OverloadNodeHelper(0, len(self.sensor_mapping_list)-1)
    
    def getPotentialOverloadNode(self):
        for mnode in self.master_node_list:
            count = self.SensorAssignedCount(self.sensor_mapping_list, 0, len(self.sensor_mapping_list)-1, mnode)
            if count < len(self.sensor_mapping_list)//2 and count >= len(self.sensor_mapping_list)//3:
                return mnode
        return -1
    
if __name__ == "__main__":
    test_system1 = System()
    
    test_system1.config_system('app_data1.csv')

    print("Overloded Master Node : ", test_system1.getOverloadedNode())
    
    print("Partially Overloaded Master Node : ", test_system1.getPotentialOverloadNode())

    test_system2 = System()
    
    test_system2.config_system('app_data2.csv')

    print("Overloded Master Node : ", test_system2.getOverloadedNode())
    
    print("Partially Overloaded Master Node : ", test_system2.getPotentialOverloadNode())

    test_system3 = System()

    test_system3.config_system('app_data3.csv')

    print("Overloded Master Node : ", test_system3.getOverloadedNode())
    
    print("Partially Overloaded Master Node : ", test_system3.getPotentialOverloadNode())

    test_system4 = System()

    test_system4.config_system('app_data4.csv')

    print("Overloded Master Node : ", test_system4.getOverloadedNode())
    
    print("Partially Overloaded Master Node : ", test_system4.getPotentialOverloadNode())
