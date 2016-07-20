# Assessment - Product Manager

[![Build Status](https://travis-ci.org/RomainEndelin/product_manager_assessment.svg?branch=master)](https://travis-ci.org/RomainEndelin/product_manager_assessment)

This project is a technical assessment for SaleStock's recruitment process. I have chosen to implement a REST API for a product manager.

It includes the following features:

* CRUD operations on products and categories;
* Hierarchical tree data of categories;
* Filtering products by color, size or price range.

## Usage

`Product Manager` has been deployed on `Heroku`, access it [here](https://product-manager-assessment.herokuapp.com).

You can interact with `Product manager` using `curl`, a [Chrome plugin](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo), a [Firefox plugin](https://addons.mozilla.org/en-US/firefox/addon/restclient/), or an [IE plugin](https://goo.gl/FkCd13).

## Installation

* **Prerequisite:**
    * Ruby v2.3.1 (I recommend using Rbenv)
    * Bundler (`$ gem install bundler`)
* **Clone:**
    * `$ git clone https://github.com/RomainEndelin/product_manager_assessment.git product_manager`
    * `$ cd product_manager`
* **Install:**
    * `bundle install`
    * `bin/rake db:setup`
* **Test:**
    * `bin/rake db:schema:load`
    * `bin/rake db:test:prepare`
    * `bin/rspec` OR `bin/guard`
* **Run:**
    * `$ rails s`

## Documentation

The API is documented with `Apiary.io`. You can access it and **test it** [here](http://docs.productmanagerassessment.apiary.io/).

## Implementation Details

TODO

## Contribute

For an overview of the project development cycle, have a look at its [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1662965).

This project is a two-days project and will most likely be discontinued later on.
In case you wish to contribute on it anyway, please [contact me](mailto:romain@endelin.fr) first. *More specifically, if you are yourself applying to SaleStock and you want to get inspired by my code, you should discuss it with your contact at SaleStock first.*

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
