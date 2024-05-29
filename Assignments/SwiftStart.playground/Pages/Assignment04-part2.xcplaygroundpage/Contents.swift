//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


//2nd Part for Assignment to be done in playground
//Simple Banking System*
//You are tasked with creating a simple banking system with Swift. The system should support the following features:
//*         Create Customer Accounts: Create customer accounts with the following details:
//   * Customer Name
//   * Account Number
//   * Initial Balance
//*         Support Different Account Types: Implement three types of accounts - Savings, Checking, and Business. Each account type may have specific features.
//*         Deposit and Withdraw: Allow customers to deposit and withdraw money from their accounts. Make sure to handle overdraft for checking accounts and minimum balance for savings accounts.
//*         Calculate Interest: For savings accounts, calculate and add monthly interest to the balance.
//*         List All Accounts: Implement a function to list all customer accounts.
//*         Transfer Funds: Implement a fund transfer feature to transfer money between two customer accounts.
//*         Calculate Total Bank Balance: Calculate the total balance of all accounts in the bank.
//Your task is to design and implement the Swift code to achieve these functionalities. You should use classes and inheritance to model accounts, use structs or enums for the account types, apply generics for flexible account management, and employ Swift collections to store and manage customer accounts. Additionally, make use of control statements for account operations, optionals for error handling, protocols and extensions for code organization.
//
//Plus points if you add more features by yourself


// Let's Define an enum for account types
enum AccountType {
    case savings
    case checking
    case business
}

// Let's create an Account protocol
// That protocol defines requirements that conforming types must implement.
// Very similar to Interfaces
protocol Account {
    // we have setters and getters when needed so that we can define if a property can be changed or accessed
    var customerName: String { get }
    var accountNumber: String { get }
    var balance: Double { get set }
    var accountType: AccountType { get }
    
    func deposit(amount: Double)
    func withdraw(amount: Double) throws
}

// This is an Error type for account operations
enum AccountError: Error {
    case insufficientFunds
    case minimumBalanceRequired
}

// Let's create a Base class for Accounts
class BaseAccount: Account {
    let customerName: String
    let accountNumber: String
    var balance: Double
    let accountType: AccountType
    
    init(customerName: String, accountNumber: String, initialBalance: Double, accountType: AccountType) {
        self.customerName = customerName
        self.accountNumber = accountNumber
        self.balance = initialBalance
        self.accountType = accountType
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) throws {
        guard balance >= amount else {
            throw AccountError.insufficientFunds
        }
        balance -= amount
    }
}

// Let's create a SavingsAccount class with interest calculation
class SavingsAccount: BaseAccount {
    let interestRate: Double = 0.02 // Example interest rate
    
    init(customerName: String, accountNumber: String, initialBalance: Double) {
        super.init(customerName: customerName, accountNumber: accountNumber, initialBalance: initialBalance, accountType: .savings)
    }
    
    func calculateInterest() {
        balance += balance * interestRate
    }
    
    override func withdraw(amount: Double) throws {
        guard balance - amount >= 100 else { // Assuming minimum balance is 100
            throw AccountError.minimumBalanceRequired
        }
        try super.withdraw(amount: amount)
    }
}

// Let's create a CheckingAccount class with overdraft handling
class CheckingAccount: BaseAccount {
    let overdraftLimit: Double = 500.0 // Example overdraft limit
    
    init(customerName: String, accountNumber: String, initialBalance: Double) {
        super.init(customerName: customerName, accountNumber: accountNumber, initialBalance: initialBalance, accountType: .checking)
    }
    
    override func withdraw(amount: Double) throws {
        guard balance + overdraftLimit >= amount else {
            throw AccountError.insufficientFunds
        }
        balance -= amount
    }
}

// Let's create a BusinessAccount class
class BusinessAccount: BaseAccount {
    init(customerName: String, accountNumber: String, initialBalance: Double) {
        super.init(customerName: customerName, accountNumber: accountNumber, initialBalance: initialBalance, accountType: .business)
    }
}

// Let's create a Bank class to manage accounts
class Bank {
    private var accounts: [String: BaseAccount] = [:] // Dictionary to store accounts with account number as key
    
    func createAccount(customerName: String, accountNumber: String, initialBalance: Double, accountType: AccountType) {
        let account: BaseAccount
        
        switch accountType {
        case .savings:
            account = SavingsAccount(customerName: customerName, accountNumber: accountNumber, initialBalance: initialBalance)
        case .checking:
            account = CheckingAccount(customerName: customerName, accountNumber: accountNumber, initialBalance: initialBalance)
        case .business:
            account = BusinessAccount(customerName: customerName, accountNumber: accountNumber, initialBalance: initialBalance)
        }
        
        accounts[accountNumber] = account
    }
    
    func listAllAccounts() {
        for account in accounts.values {
            print("Account Number: \(account.accountNumber), Customer Name: \(account.customerName), Balance: \(account.balance), Account Type: \(account.accountType)")
        }
    }
    
    func transferFunds(from fromAccountNumber: String, to toAccountNumber: String, amount: Double) throws {
        guard let fromAccount = accounts[fromAccountNumber], let toAccount = accounts[toAccountNumber] else {
            return
        }
        
        try fromAccount.withdraw(amount: amount)
        toAccount.deposit(amount: amount)
    }
    
    func calculateTotalBankBalance() -> Double {
        return accounts.values.reduce(0) { $0 + $1.balance }
    }
}

// Example Usage
let bank = Bank()
bank.createAccount(customerName: "John Doe", accountNumber: "123456789", initialBalance: 1000, accountType: .savings)
bank.createAccount(customerName: "Jane Smith", accountNumber: "987654321", initialBalance: 500, accountType: .checking)
bank.createAccount(customerName: "Acme Corp", accountNumber: "111222333", initialBalance: 10000, accountType: .business)

bank.listAllAccounts()

do {
    try bank.transferFunds(from: "123456789", to: "987654321", amount: 200)
} catch {
    print("Transfer failed: \(error)")
}

print("Total Bank Balance: \(bank.calculateTotalBankBalance())")
