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
control "check-lab-7-tags" do
    impact 0.3
    title "Check GitLab Runner Tags"
    desc "Check for the soon-to-be-required Lab 7 tag on our EC2 instance"
    
    describe aws_ec2_instance(name: 'PipelineInstance') do
        its('tags') { should include(key: 'Lab7', value: 'completed') }
    end
end
control "check-accesskey-usage" do
    impact 0.3
    title "Check If Access Key Usage Within 60 Days"
    desc "Check for the Usage of my Access Key within a period of 60 days"
    
    describe aws_iam_access_key(access_key_id: 'AKIA5PLC7C7FYQKB7RHN') do
        it                    { should exist }
        its('last_used_date') { should be > Time.now - 60 * 86400 }
    end
end