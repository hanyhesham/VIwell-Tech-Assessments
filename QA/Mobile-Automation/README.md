# Coding task for Mobile QA Automation Engineer

## The Goal

Your task is to write automated tests preferably with [Appium](https://appium.io/) to demonstrate your test automation abilities.

## The Process

1. Start a new github repository with detailed "README" document includes the information about platform, app, tools, frameworks etc and on how to execute the tests.
1. Download Amazon Shopping Android or App Store Package (APK or IPA)
1. Write end-to-end tests fulfilling the [Acceptance Criteria](#acceptance-criteria) below.
1. Publish test execution summary report in html format.
1. Include all tests related document in same github repository.

- Use below package and activity name (Appium)
  - appPackage=com.amazon.mShop.android.shopping
  - appActivity=com.amazon.mShop.home.HomeActivity

## Acceptance Criteria

- Scenario 1: [Check the total displayed number of results for category Smart Home | Televisions]

  1.  Open app on [Amazon.com](https://www.amazon.com/) store
  2.  Click on Shop by Department from burger menu
  3.  Choose category ‘Electronics’
  4.  Choose sub-category category ’TV & VIDEO’
  5.  Filter with ’Smart TV’ and click show results
  6.  Check the total number of results match the total displayed in filter

- Scenario 2: [Check filter by department in Deals and Promotions page]

  1. Tab on Today's Deals
  2. From Departments filter, Show see more
  3. Select Software department
  4. Assert on choosing the correct selected department

- Scenario 3: [Check the selected currency displayed for the products' price]

  1. Go to Currency Settings
  2. Select Country & Language
  3. Change currency from 'USD' to 'AED'
  4. Save changes
  5. Assert on selected currency displayed for Deals and Promotions products

## Bonus Round (not required, but nice-to-have)

- Integration of your tests into a CI pipeline
- Manual test cases to cover the given scenarios
- Report any found bugs with associated screenshots
- Surprise us…

## How we're evaluating the results

Prioritized from most important to least important, here are our evaluation criteria:

1. **Acceptance Criteria**: Have all acceptance criteria been fulfilled correctly?
1. **Code Quality**: Is the code that you've written clean, well-structured and easy to understand?
1. **Documentation**: Did you document how to run your tests well? Is your written communication clear and easy-to-understand?
1. **The extra mile**: Everything you did on top of the acceptance criteria.

## How to submit your work

Create a public repo on Github and push your code on it. then share the link back with us.
