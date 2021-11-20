title 'Lab 7 Compliance Controls'
control "check-instance-exists-started" do
    impact 0.3
    title "Check Instance Status"
    desc "Verify that our EC2 instance exists and is running"
    describe aws_ec2_instance(name: 'PipelineInstance') do
            it { should exist }
        end
    describe aws_ec2_instance(name: 'PipelineInstance') do
            it { should be_running }
        end
    end
control "check-instance-ami" do
    impact 0.3
    title "Check Instance AMI"
    desc "Verify that our EC2 instance AMI is the latest supported release 
of CentOS 7"
    describe aws_ec2_instance(name: 'PipelineInstance') do
    its('image_id') { should eq 'ami-00e87074e52e6c9f9' }
    end
end