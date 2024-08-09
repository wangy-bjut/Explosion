#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include "robot_msgs/centerAction.h"
#include <actionlib/client/terminal_state.h>
#include "robot_msgs/setint16.h"
 
using namespace  std;

typedef actionlib::SimpleActionClient<robot_msgs::centerAction> center_client;  //动作客户端数据类型


class CENTERCLIENT
{
public:
    CENTERCLIENT();
    
    ros::NodeHandle nh;
    ros::ServiceServer server;
    center_client client;

    bool client_callback(robot_msgs::setint16::Request &req,
                          robot_msgs::setint16::Response &res);
private:
};

CENTERCLIENT::CENTERCLIENT():client("center_server",true)   
{
    client.waitForServer();
    server = nh.advertiseService("center_client",&CENTERCLIENT::client_callback,this);  
    ROS_INFO("init ok!");
}


void doneCb(const actionlib::SimpleClientGoalState& state, const robot_msgs::centerResultConstPtr& result)
{
    ROS_INFO("DONE");
    //ros::shutdown();
}


void activeCb()
{
    ROS_INFO("ACTIVE");
}


void feedbackCb(const robot_msgs::centerFeedbackConstPtr& feedback)
{
    ROS_INFO("THE NUMBER RIGHT NOM IS: %s",feedback->message.c_str());
}

bool CENTERCLIENT::client_callback(robot_msgs::setint16::Request &req,
                                   robot_msgs::setint16::Response &res)
{
    bool checkout = client.waitForServer(ros::Duration(5));
    if (!checkout)
    {
        res.message = "Unable to connect to the action server...";
        res.success = false;
        return false;
    }
    
    robot_msgs::centerGoal goal;

    if(req.data>=0)
    {
        goal.point_number=req.data;
        client.sendGoal(goal,doneCb,activeCb,feedbackCb);

    }else{
        client.cancelAllGoals();
    }

    client.waitForResult();
    if (client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    {
        res.success = true;
        res.message = "Succeeded...";
    }
    else if(client.getState() == actionlib::SimpleClientGoalState::PREEMPTED)
    {
        res.success = true;
        res.message = "Preempted...";
    }
    else
    {
        res.success = false;
        res.message = "Failed...";
    }
    cout<<"The Result is:\t"<<client.getState().toString().c_str()<<endl;
    return true;
}

int main(int argc, char *argv[])
{
    /* code for main function */
    ros::init(argc, argv, "center_client"); 
    CENTERCLIENT centerclient;  

    ros::AsyncSpinner spinner(2); 
    spinner.start();    
    ros::waitForShutdown(); 
    return 0;
}