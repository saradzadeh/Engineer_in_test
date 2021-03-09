require "selenium-webdriver"
require "rspec"

#Test scenario: subscription prompt pops up at the bottom of the page and disapears after 10 seconds.

describe "subscription prompt" do

    describe "dislaying subscription" do
        it "successfully see the subscription" do
            driver = Selenium::WebDriver.for :firefox

            #defiing a variable to check the time
            wait = Selenium::WebDriver::Wait.new(:timeout => 10)
            
            #go to the URL
            driver.navigate.to "https://www.afr.com/policy/foreign-affairs/capability-edge-and-keeping-south-china-sea-open-crucial--christopher-pyne-20180924-h15rq9"

            #confirm if user can see the subscription after loading the page
            #find the element of the subscription prompt
            subscription_prompt = driver.find_element class: "_2TxFI"
            subscription_prompt.displayed?

            #check the location of subscription prompt
            subscription_prompt.location


            #Check if the subscription prompt displays after 10 seconds
            wait.until { driver.find_element class: "_2TxFI"}
            subscription_prompt.displayed?
            
        
            driver.quit    
        end
    end
end

