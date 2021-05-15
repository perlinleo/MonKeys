// Copyright 2021 Monkeys. All rights reserved.
//  __  __                   _  __
// |  \/  |   ___    _ __   | |/ /   ___   _   _   ___
// | |\/| |  / _ \  | '_ \  | ' /   / _ \ | | | | / __|
// | |  | | | (_) | | | | | | . \  |  __/ | |_| | \__ \
// |_|  |_|  \___/  |_| |_| |_|\_\  \___|  \__, | |___/
//                                         |___/

#ifndef VISIONLIB_INCLUDE_CLIENT_HPP_
#define VISIONLIB_INCLUDE_CLIENT_HPP_

#include <boost/asio/strand.hpp>
#include <boost/beast/core.hpp>
#include <boost/beast/http.hpp>
#include <boost/beast/version.hpp>
#include <boost/property_tree/json_parser.hpp>
#include <boost/property_tree/ptree.hpp>
#include <cstdlib>
#include <functional>
#include <iostream>
#include <memory>
#include <string>
#include <vector>

namespace beast = boost::beast;
namespace http = beast::http;
namespace net = boost::asio;
namespace property_tree = boost::property_tree;
using tcp = boost::asio::ip::tcp;

#include "WebApplicationClient.hpp"

class Client : public IWebApplicationClient {
 public:
  class Pass {
   public:
    Pass();
    Pass(uint64_t _ID, std::string _privateKey, std::string _companyName);
    ~Pass();

    Pass(const Pass&) = delete;
    Pass(Pass&&) = default;

    Pass& operator=(const Pass&) = delete;
    Pass& operator=(Pass&&) = delete;

    // запрос на генерацию временного кода по privateKey пропуска
    std::string requestTempCode();

    // гетеры
    void getID();
    void getPrivateKey();
    void getCompanyName();

    // сетеры
    void setID(uint64_t _ID);
    void setPrivateKey(std::string _privateKey);
    void setCompanyName(std::string _companyName);

   private:
    uint64_t ID;
    std::string privateKey;
    std::string companyName;
  };

  Client();
  Client(uint64_t _ID, Pass* _passes, uint16_t _passesCount, std::string _name,
         std::string _password, bool _isConnected = false,
         bool _isLogin = false);
  ~Client();

  Client(const Client&) = delete;
  Client(Client&&) = delete;

  Client& operator=(const Client&) = delete;
  Client& operator=(Client&&) = delete;

  // авторизация пользователя
  void logIn() override;
  // выход пользователя из аккаунта
  void logOut() override;
  // регистрация пользователя
  void registerClient() override;
  // запрос на выдачу всех пропусков пользователя
  void requestPasses() override;
  // получение временного кода по выбранному пропуску
  std::string getTempPass(const uint64_t passID) override;

  // установление соединения
  void establishConnection(const char* url) override;
  // разрыв соединения
  void breakConnection() override;

  // гетеры
  uint64_t getID();
  Pass* getPasses();
  uint16_t getPassesCount();
  std::string getName();
  Pass getPass(uint64_t index);
  bool getIsConnected();
  bool getIsLogIn();

  // сетеры
  void setID(uint64_t _ID);
  void setPasses(Pass* currentPasses);
  void setPassesCount(uint16_t _passesCount);
  void setName(std::string _name);
  void setIsConnected(const bool value);
  void setIsLogIn(const bool value);

 private:
  uint64_t ID;
  Pass* passes;
  uint16_t passesCount;
  std::string name;
  std::string password;
  bool isConnected;
  bool isLogin;
};

// Report a failure
void failOnClient(beast::error_code ec, char const* what);

template <class Body, class Allocator, class Send>
void sendRequest(beast::error_code ec,
                 http::request<Body, http::basic_fields<Allocator>>&& req,
                 Send&& send);

// Performs an HTTP GET and prints the response
class ClientSession : public std::enable_shared_from_this<ClientSession> {
  struct send_lambda {
    ClientSession& self_;

    explicit send_lambda(ClientSession& self) : self_(self) {}

    template <bool isRequest, class Body, class Fields>
    void operator()(http::message<isRequest, Body, Fields>&& msg) const;
  };

  tcp::resolver resolver_;
  beast::tcp_stream stream_;
  beast::flat_buffer buffer_;  // (Must persist between reads)
  http::request<http::string_body> req_;
  http::response<http::string_body> res_;
  std::shared_ptr<void> reqsp_;
  send_lambda lambda_;

 public:
  // Objects are constructed with a strand to
  // ensure that handlers do not execute concurrently.
  explicit ClientSession(net::io_context& ioc)
      : resolver_(net::make_strand(ioc)),
        stream_(net::make_strand(ioc)),
        lambda_(*this) {}

  // Start the asynchronous operation
  void run(char const* host, char const* port, char const* target, int version);

  void on_resolve(beast::error_code ec, tcp::resolver::results_type results);

  void on_connect(beast::error_code ec,
                  tcp::resolver::results_type::endpoint_type);

  void on_write(bool close, beast::error_code ec,
                std::size_t bytes_transferred);

  void do_read();

  void on_read(beast::error_code ec, std::size_t bytes_transferred);
};

#endif  // VISIONLIB_INCLUDE_CLIENT_HPP_